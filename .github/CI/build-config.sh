#!/bin/bash

## This script builds one or more configurations using cmake and ninja
## Arguments:
##   1. (Optional): Name of build configuration (Debug/RelWithDebInfo/etc)
##   2. (Optional): Whether to use /usr/bin/clang++ (TRUE)

## Set config
CONFIG=$1
[[ -z $CONFIG ]] && CONFIG=Release

## Set CXX_FLAGS (clang paths)
USE_CLANG=$2
USE_[[ -z $CLANG ]] && CLANG=TRUE
USE_[[ $CLANG == "TRUE" ]] && CXX_FLAGS="-DCMAKE_C_CLANG=/usr/bin/clang -DCMAKE_CXX_CLANG=/usr/bin/clang++"

## Build config
[[ ! -d out/$CONFIG ]] && mkdir -p out/$CONFIG
cmake -G Ninja . -Bout/$CONFIG $CXX_FLAGS -DCI_BUILD=1 -DCMAKE_BUILD_TYPE=$CONFIG
ninja -v -C out/$CONFIG

exit
