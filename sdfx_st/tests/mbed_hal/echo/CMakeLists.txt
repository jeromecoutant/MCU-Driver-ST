# Copyright (c) 2021 ARM Limited. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

cmake_minimum_required(VERSION 3.19.0 FATAL_ERROR)

set(MBED_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../../../../MCU-Driver-HAL CACHE INTERNAL "")
set(MBED_CONFIG_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../../../.mbedbuild CACHE INTERNAL "")

set(TEST_TARGET sdfx-st-test-echo)
set(TEST_TARGET_LIB sdfx-test-echo)

include(${MBED_PATH}/tools/cmake/app.cmake)

add_subdirectory(../../../.. ./MCU-Driver-ST)

add_executable(${TEST_TARGET})

mbed_configure_app_target(${TEST_TARGET})

project(${TEST_TARGET})

target_link_libraries(${TEST_TARGET}
    PRIVATE
        ${TEST_TARGET_LIB}
)

mbed_set_post_build(${TEST_TARGET})

option(VERBOSE_BUILD "Have a verbose build process")
if(VERBOSE_BUILD)
    set(CMAKE_VERBOSE_MAKEFILE ON)
endif()
