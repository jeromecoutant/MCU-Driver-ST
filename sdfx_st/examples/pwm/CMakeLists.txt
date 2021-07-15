# Copyright (c) 2020 ARM Limited. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

cmake_minimum_required(VERSION 3.19.0 FATAL_ERROR)

set(MBED_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../../../MCU-Driver-HAL CACHE INTERNAL "")
set(MBED_CONFIG_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../../.mbedbuild CACHE INTERNAL "")
set(APP_TARGET sdfx-st-hal-example-pwm)

include(${MBED_PATH}/tools/cmake/app.cmake)

add_subdirectory(../../.. ./MCU-Driver-ST)

add_executable(${APP_TARGET})

mbed_configure_app_target(${APP_TARGET})

project(${APP_TARGET})

target_link_libraries(${APP_TARGET}
    PRIVATE
        sdfx-hal-example-pwm
)

mbed_set_post_build(${APP_TARGET})

option(VERBOSE_BUILD "Have a verbose build process")
if(VERBOSE_BUILD)
    set(CMAKE_VERBOSE_MAKEFILE ON)
endif()
