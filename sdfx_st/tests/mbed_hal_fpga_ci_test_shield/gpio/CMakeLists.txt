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

cmake_minimum_required(VERSION 3.19.0 FATAL_ERROR)

set(MBED_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../../../../MCU-Driver-HAL CACHE INTERNAL "")
set(MBED_CONFIG_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../../../.mbedbuild CACHE INTERNAL "")

include(${MBED_PATH}/tools/cmake/app.cmake)

add_subdirectory(../../../.. ./MCU-Driver-ST)

add_executable(sdfx-st-fpga_ci_test_shield-gpio)

mbed_configure_app_target(sdfx-st-fpga_ci_test_shield-gpio)

project(sdfx-st-fpga_ci_test_shield-gpio)

target_link_libraries(sdfx-st-fpga_ci_test_shield-gpio
    PRIVATE
        sdfx-fpga_ci_test_shield-gpio
)

mbed_set_post_build(sdfx-st-fpga_ci_test_shield-gpio)
