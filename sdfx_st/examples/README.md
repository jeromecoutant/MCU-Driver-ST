# MCU-Driver-HAL Examples

This directory contains the build instructions for the examples defined in the MCU-Driver-HAL repository.

Each example build instructions provides access to hardware specific source code and link with the example main algorithm provided as a library that is linked to the executable.

## Building the example

Each application can be built by doing the following:
1. Clone the repository recursively to get the `MCU-Driver-HAL` submodule:
    ```
    git clone --recursive https://github.com/MCU-Driver-HAL/MCU-Driver-ST
    ```
1. Change the current working directory to `MCU-Driver-ST/sdfx_st/examples/<INTERFACE>/`
1. Run:
    ```
    cmake -S . -B cmake_build -GNinja -DCMAKE_BUILD_TYPE=debug -DMBED_TOOLCHAIN=<TOOLCHAIN>
    ```
1. Change the current working directory to `MCU-Driver-ST/sdfx_st/examples/<INTERFACE>/cmake_build/`
1. Run:
    ```
    cmake --build .
    ```
    
Outcome: The application compiles, links and produces artefacts.

# Program the artefact
From `MCU-Driver-ST/sdfx_st/examples/<INTERFACE>/cmake_build/`, copy the binary to the device with the following command:
```
cp sdfx-stm-example-<INTERFACE>.bin <MOUNT_POINT_PATH>
```
E.g
```
cp sdfx-st-hal-example-gpio.bin /Volumes/DIS_L4IOT/
```
