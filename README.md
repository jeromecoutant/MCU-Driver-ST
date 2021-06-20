# MCU-Driver-HAL for STMicroelectronics

This repository contains the driver implementation for STM32 boards.

Please check the [examples](/sdfx_st/examples/README.md) to get started.

## ST TOOLS

### USB drivers

Mandatory: get the latest USB driver in order to make available all the USB interfaces provided by the ST-LINK:
- ST Debug
- Virtual COM port
- ST Bridge interfaces

Default Windows USB drivers will not setup full capabilities.

https://www.st.com/en/development-tools/stsw-link009.html


### ST-Link FW

Mandatory: get the latest ST-Link Firmware:

https://www.st.com/en/development-tools/stsw-link007.html

You could have some issue to connect your board if you didn't install full USB drivers.


### STM32 Cube

https://www.st.com/en/embedded-software/stm32cube-mcu-packages.html

There is one STM32Cube package for each individual STM32 MCU family.

It includes:
- The hardware abstraction layer (HAL) enabling portability between different STM32 devices via standardized API calls
- Low-layer (LL) APIs, a light-weight, optimized, expert oriented set of APIs designed for both performance and runtime efficiency
- A collection of middleware components including RTOS, USB library, file system, TCP/IP stack, touch-sensing library or graphics library (depending on the STM32 series)
- BSP drivers, based on HAL drivers.

Part of STM32Cube files are copied in each ./TARGET_STM32<xx\>/STM32Cube_FW directory:
- CMSIS header files in CMSIS sub-directory
- HAL and LL files in STM32\<XX\>xx_HAL_Driver sub-directory

MCU-Driver-ST uses the MCU-Driver-HAL repository has hardware abstraction for peripheral drivers.

Note that all ST HAL and LL files are available:
- you can then develop some applications with direct ST HAL and LL call, even if feature is not supported.
- BSP for LCD, AUDIO, SENSORS, etc... are not available in Mbed OS, but you should be able to use it in your local application.


Each STM32Cube package is also available in Github.
This table summarizes the STM32Cube versions currently used in MCU-Driver-ST main branch :

| STM32 Serie | Cube version | Github source                                     |
|-------------|--------------|---------------------------------------------------|
| L4          |    1.17.0    | https://github.com/STMicroelectronics/STM32CubeL4 |


### STM32CubeMX

STM32CubeMX is a graphical tool that allows a very easy configuration of all STM32

https://www.st.com/en/development-tools/stm32cubemx.html

The tool is not used in MCU-Driver-HAL but it can be useful for you.


### STM32CubeProgrammer

It provides an easy-to-use and efficient environment for reading, writing and verifying device memory.

https://www.st.com/en/development-tools/stm32cubeprog.html

The tool is not used in MCU-Driver-HAL but it can be useful for you.


## STM32 families

This repository contains STM32 families directories for STM32L475xG Part Number.



