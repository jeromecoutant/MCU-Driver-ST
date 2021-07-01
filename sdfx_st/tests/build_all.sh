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

TESTS_BUILT=()

if [[ "$(uname -s)" == "Darwin" ]]; then
  ncpu=$(( $(sysctl -n hw.ncpu) - 1))
else
  ncpu=$(( $(nproc) - 1 ))
fi

for TEST_PATH in $(find ./ -type f -name CMakeLists.txt); do
    TEST_DIR_PATH=$(dirname "$TEST_PATH")
    printf 'Building %s\n' "$TEST_DIR_PATH"
    pushd "$TEST_DIR_PATH" || exit
    cmake \
        -S ./ \
        -B ./cmake_build \
        -DGREENTEA_CLIENT_STDIO=OFF \
        -DMBED_TOOLCHAIN=GCC_ARM \
        -DCMAKE_BUILD_TYPE=develop \
        --log-level=ERROR \
        || exit
    cmake --build ./cmake_build -j $ncpu || exit
    popd || exit
    TESTS_BUILT+=("$TEST_DIR_PATH")
done

printf '\nBUILD SUMMARY:\n'
printf '%s\n' "${TESTS_BUILT[@]}"
