# Copyright (c) 2021 ARM Limited. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

cmake_minimum_required(VERSION 3.19.0 FATAL_ERROR)

set(MBED_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../../../../MCU-Driver-HAL CACHE INTERNAL "")
set(MBED_CONFIG_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../../../.mbedbuild CACHE INTERNAL "")

include(${MBED_PATH}/tools/cmake/app.cmake)

add_subdirectory(../../../.. ./MCU-Driver-ST)

add_executable(sdfx-st-test-us_ticker_lp_ticker_common)

mbed_configure_app_target(sdfx-st-test-us_ticker_lp_ticker_common)

project(sdfx-st-test-us_ticker_lp_ticker_common)

target_link_libraries(sdfx-st-test-us_ticker_lp_ticker_common
    PRIVATE
        sdfx-test-us_ticker_lp_ticker_common
)

mbed_set_post_build(sdfx-st-test-us_ticker_lp_ticker_common)

option(VERBOSE_BUILD "Have a verbose build process")
if(VERBOSE_BUILD)
    set(CMAKE_VERBOSE_MAKEFILE ON)
endif()
