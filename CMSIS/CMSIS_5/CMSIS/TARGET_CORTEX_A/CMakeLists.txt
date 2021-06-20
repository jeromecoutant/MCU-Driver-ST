# Copyright (c) 2020-2021 ARM Limited. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

add_library(cmsis-cortex-a INTERFACE)

target_include_directories(cmsis-cortex-a
    INTERFACE
        Include
)

target_sources(cmsis-cortex-a
    INTERFACE
        Source/irq_ctrl_gic.c
)
