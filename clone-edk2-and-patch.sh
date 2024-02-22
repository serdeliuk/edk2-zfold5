#!/bin/bash

cd ..
git clone https://github.com/tianocore/edk2 --recursive
git clone https://github.com/tianocore/edk2-platforms --recursive
cd ./edk2/BaseTools
make
cd ..
cd ..
patch -p1 < ./edk2-q5q_kalama/patch-edk2-spurious-flood.patch
