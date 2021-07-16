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


EXAMPLES_BUILT=()

if [[ "$(uname -s)" == "Darwin" ]]; then
  ncpu=$(( $(sysctl -n hw.ncpu) - 1))
else
  ncpu=$(( $(nproc) - 1 ))
fi

for EXAMPLE_PATH in $(find ./ -type f -name CMakeLists.txt); do
    EXAMPLE_DIR_PATH=$(dirname "$EXAMPLE_PATH")
    printf 'Building %s\n' "$EXAMPLE_DIR_PATH"
    pushd "$EXAMPLE_DIR_PATH" || exit
    cmake \
        -S ./ \
        -B ./cmake_build \
        -DMBED_TOOLCHAIN=GCC_ARM \
        -DCMAKE_BUILD_TYPE=develop \
        || exit
    cmake --build ./cmake_build -j $ncpu || exit
    popd || exit
    EXAMPLES_BUILT+=("$EXAMPLE_DIR_PATH")
done

printf '\nBUILD SUMMARY:\n'
printf '%s\n' "${EXAMPLES_BUILT[@]}"
