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

TESTS_RUN=()

for TEST_BIN_PATH in $(find ./ -type f -name "sdfx-st-*test*.bin"); do
    printf 'Running %s\n' "$TEST_BIN_PATH"
    mbedhtrun \
        --image-path="$TEST_BIN_PATH" \
        --enum-host-tests="../../MCU-Driver-HAL/tests/host_tests/" \
        --disk="/media/$USER/DIS_L4IOT/" \
        --port="/dev/ttyACM0:115200" \
        || exit
    TESTS_RUN+=("$TEST_BIN_PATH")
done

printf '\nRUN SUMMARY:\n'
printf '%s\n' "${TESTS_RUN[@]}"
