#!/bin/bash

## This script removes existing CMake (usually 3.12 on Ubuntu) and installs the latest:
##   - cmake
##   - g++
##   - ninja-build
## Arguments: 
##   1. (Optional) Whether to install clang/llvm (TRUE)

ENV="cmake g++-8 ninja-build"
CLANG=$1

# Get latest keys for cmake, g++, etc
wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | sudo apt-key add -
sudo apt-add-repository 'deb https://apt.kitware.com/ubuntu/ bionic main' -y
sudo -E apt-add-repository -y "ppa:ubuntu-toolchain-r/test"

# Purge all existing cmake installations
sudo apt-get purge cmake
sudo rm -rf /usr/bin/cmake*
sudo rm -rf /usr/share/cmake*
sudo rm -rf /usr/local/bin/cmake*

# Install dependencies
sudo apt-get update
sudo apt-get install -y $ENV
[[ "$CLANG" == "TRUE" ]] && sudo bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"

exit
