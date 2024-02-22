#!/bin/bash

export PACKAGES_PATH=$PWD/../edk2:$PWD/../edk2-platforms:$PWD
export WORKSPACE=$PWD/workspace
. ../edk2/edksetup.sh

# clean
echo "Cleaning...."
rm recovery.img 
rm -rf workspace/Build

echo "Building...."
# not actually GCC5; it's GCC7 on Ubuntu 18.04. ;; gcc 11.4.0 on Ubuntu 22.04 
GCC5_AARCH64_PREFIX=aarch64-linux-gnu- build -s -n 0 -a AARCH64 -t GCC5 -p GalaxyZfold5Pkg/GalaxyZfold5Pkg.dsc
#build -s -n 0 -a AARCH64 -t CLANG38 -p GalaxyZfold5Pkg/GalaxyZfold5Pkg.dsc

BOOTIMG_OS_PATCH_LEVEL="2022-11"
BOOTIMG_OS_VERSION="13.0.0"

echo "Adding BootShim...."
        cat prebuilt/BootShim.bin workspace/Build/q5q/DEBUG_GCC5/FV/SM8550_UEFI.fd > workspace/Build/uefi_image-bootshim
echo "Compressing...."
        gzip -c < workspace/Build/uefi_image-bootshim > workspace/Build/uefi_image-bootshim.img.gz
echo "Adding the dtb...."
        cat workspace/Build/uefi_image-bootshim.img.gz prebuilt/q5q.dtb > workspace/Build/uefi_image-bootshim.img.gz-dtb

echo "Creating recovery.img...."
        python3 prebuilt/mkbootimg.py --kernel "workspace/Build/uefi_image-bootshim.img.gz-dtb" \
                --ramdisk prebuilt/ramdisk \
                --kernel_offset 0x00000000 \
                --ramdisk_offset 0x00000000 \
                --tags_offset 0x00000000 \
                --os_version "${BOOTIMG_OS_VERSION}" \
                --os_patch_level "${BOOTIMG_OS_PATCH_LEVEL}" \
                --header_version 1 \
                -o "recovery.img"
echo "DONE!!!"
