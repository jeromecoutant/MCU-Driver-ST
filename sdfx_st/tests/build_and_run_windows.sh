#!/bin/bash

# Copyright (c) 2021 Arm Limited
# SPDX-License-Identifier: Apache-2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Usage:
# in MCU-Driver-ST directory
#       subst.exe P: $PWD
#       cd /p/sdfx_st/tests/
#       ./build_and_run_windows.sh
#       ./build_and_run_windows.sh gpio


PATH_PATTERN='*'
if [ -n "$1" ]; then
    PATH_PATTERN=$1
    printf 'PATH_PATTERN %s\n' "*$PATH_PATTERN*"
fi

TOOLCHAIN=GCC_ARM
# TOOLCHAIN=ARM
printf 'TOOLCHAIN %s\n' "$TOOLCHAIN"

# windows workaround for lon path name issue
mv -v mbed_hal/us_ticker_lp_ticker_common mbed_hal/lp_ticker_com
mv -v mbed_hal/us_ticker_lp_ticker_frequency mbed_hal/lp_ticker_freq
mv -v mbed_hal_fpga_ci_test_shield fpga

# mbedls is used for easy script
TARGET_COM=$(mbedls -s | grep DISCO_L475VG_IOT01A | awk {'print $4'})
TARGET_DRIVE=$(mbedls -s | grep DISCO_L475VG_IOT01A | awk {'print $3'})
printf 'TARGET_COM %s\n' "${TARGET_COM}"
printf 'TARGET_DRIVE %s\n' "${TARGET_DRIVE}"

TESTS_BUILT=()
TESTS_OK=()
TESTS_FAILED=()

echo
for TEST_PATH in $(find ./ -type f -name CMakeLists.txt -path "*$PATH_PATTERN*"); do
    TEST_DIR_PATH=$(dirname "$TEST_PATH")
    printf 'Building %s\n' "$TEST_DIR_PATH"
    pushd "$TEST_DIR_PATH" || exit
    cmake \
        -S ./ \
        -B ./cmake_build/$TOOLCHAIN \
        -D GREENTEA_CLIENT_STDIO=OFF \
        -D MBED_TOOLCHAIN=$TOOLCHAIN \
        -D CMAKE_BUILD_TYPE=develop \
        --log-level=ERROR -GNinja\
        || exit
    cmake --build ./cmake_build/$TOOLCHAIN -j $ncpu || exit
    popd || exit
    TESTS_BUILT+=("$TEST_DIR_PATH")

    TEST_BIN_PATH=$(find $TEST_DIR_PATH -type f -name "sdfx-st-*test*.bin")
    printf 'Running %s\n' "$TEST_BIN_PATH"
    TEST_RESULT=0
    TEST_CONSOLE="$TEST_DIR_PATH/test_result.log"

    mbedhtrun \
        --image-path="$TEST_BIN_PATH" \
        --enum-host-tests="../../MCU-Driver-HAL/tests/host_tests/" \
        --disk=$TARGET_DRIVE \
        --port=$TARGET_COM:115200 > $TEST_CONSOLE \
        || TEST_RESULT=1
        
    if [ $TEST_RESULT -eq 0 ]; then
        TESTS_OK+=("$TEST_BIN_PATH => $TEST_CONSOLE")
    else
        TESTS_FAILED+=("$TEST_BIN_PATH => $TEST_CONSOLE")
    fi
done

printf '\nBUILD SUMMARY:\n'
printf '%s\n' "${TESTS_BUILT[@]}"

printf '\nTESTS OK:\n'
printf '%s\n' "${TESTS_OK[@]}"

printf '\nTESTS FAILED:\n'
printf '%s\n' "${TESTS_FAILED[@]}"
