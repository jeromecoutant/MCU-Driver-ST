# Copyright (c) 2021 ARM Limited. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

set(MBED_PATH ${CMAKE_CURRENT_SOURCE_DIR}/MCU-Driver-HAL CACHE INTERNAL "")

add_subdirectory(${MBED_PATH})
add_subdirectory(CMSIS EXCLUDE_FROM_ALL)
add_subdirectory(TARGET_STM32L4 EXCLUDE_FROM_ALL)
add_subdirectory(sdfx_st/hal EXCLUDE_FROM_ALL)

add_library(stm-sdk INTERFACE)

target_include_directories(stm-sdk
    INTERFACE
        .
)

target_link_libraries(stm-sdk
    INTERFACE
        cmsis-cortex-m
)
