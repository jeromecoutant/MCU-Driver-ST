# Copyright (c) 2021 ARM Limited. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

add_library(sdfx-hal-st INTERFACE)

target_include_directories(sdfx-hal-st
    INTERFACE
        inc
)

target_sources(sdfx-hal-st
    INTERFACE
        # src/USBPhy_STM32.cpp
        # src/analogin_api.c
        # src/analogout_api.c
        # src/can_api.c
        src/gpio_api.c
        # gpio_irq_api.c
        src/hal_tick_overrides.c
        # src/i2c_api.c
        # src/lp_ticker.c
        # src/mbed_crc_api.c
        src/mbed_overrides.c
        src/ospi_api.c
        src/pinmap.c
        # src/port_api.c
        src/pwmout_api.c
        # src/qspi_api.c
        # src/reset_reason.c
        # src/rtc_api.c
        src/serial_api.c
        # src/sleep.c
        src/stm_spi_api.c
        src/trng_api.c
        src/us_ticker.c
        # src/watchdog_api.c
)

target_link_libraries(sdfx-hal-st
    INTERFACE
        mbed-os
)
