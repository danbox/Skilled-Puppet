#!/bin/bash

# Install the nvidia drivers for the GPU
# Note: you must have disabled secure boot in the BIOS
deb http://ppa.launchpad.net/graphics-drivers/ppa/ubuntu xenial main
sudo apt-get install -f mesa-utils
sudo apt-get install -f nvidia-381

