# Release notes

This document contains details of releases for the `MCU-Driver-ST` repository.

0.1.0 (2021-06-18)
===================

Features
--------

* Initial driver implementation for [MCU-Driver-HAL v0.1.0](https://github.com/ARMmbed/MCU-Driver-HAL/tree/0.1.0)

Includes:
* STM32CubeL4 v1.17.0
* [Example applications](./sdfx_st/examples/README.md)
  * flash, gpio, interrupt, serial, spi, trace, trng, us_ticker
* Greentea tests
  * Echo Serial

The examples and tests have been validated on the [ST B-L475E-IOT01A Discovery kit](https://www.st.com/en/evaluation-tools/b-l475e-iot01a.html)
