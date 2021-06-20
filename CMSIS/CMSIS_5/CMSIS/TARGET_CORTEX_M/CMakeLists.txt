# Copyright (c) 2020-2021 ARM Limited. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

add_library(cmsis-cortex-m INTERFACE)

target_include_directories(cmsis-cortex-m
    INTERFACE
        Include
)

target_sources(cmsis-cortex-m
    INTERFACE
        Source/mbed_tz_context.c
)
