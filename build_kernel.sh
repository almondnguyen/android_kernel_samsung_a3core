#!/bin/bash

# clone this config https://github.com/pkm774/android-kernel-tools
export CROSS_COMPILE=$(pwd)/../PLATFORM/android-kernel-tools/gcc/linux-x86/aarch64/gcc-linaro-7.5.0/bin/aarch64-linux-gnu-
export ARCH=arm64
export CLANG_TOOL_PATH=$(pwd)/../PLATFORM/android-kernel-tools/clang/host/linux-x86/clang-r428724/bin/
export PATH=${CLANG_TOOL_PATH}:${PATH//"${CLANG_TOOL_PATH}:"}

export BSP_BUILD_FAMILY=sharkl3
export DTC_OVERLAY_TEST_EXT=$(pwd)/tools/mkdtimg/ufdt_apply_overlay
export DTC_OVERLAY_VTS_EXT=$(pwd)/tools/mkdtimg/ufdt_verify_overlay_host
# export BSP_BUILD_ANDROID_OS=y

make -C $(pwd) O=$(pwd)/out BSP_BUILD_DT_OVERLAY=y CC=clang LD=ld.lld ARCH=arm64 CLANG_TRIPLE=aarch64-linux-gnu- a3core_eur_open_defconfig -j4
make -C $(pwd) O=$(pwd)/out BSP_BUILD_DT_OVERLAY=y CC=clang LD=ld.lld ARCH=arm64 CLANG_TRIPLE=aarch64-linux-gnu- -j4

cp out/arch/arm64/boot/Image $(pwd)/arch/arm64/boot/Image
