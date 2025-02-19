#!/bin/bash

# Remove the local manifests directory if it exists (cleanup before repo initialization)
rm -rf .repo/local_manifests/

# remove device tree
rm -rf device/xiaomi/
rm -rf device/xiaomi/
rm -rf kernel/xiaomi/
rm -rf vendor/xiaomi/
rm -rf hardware/xiaomi

# Initialize ROM manifest
repo init -u https://github.com/Evolution-X/manifest -b vic --git-lfs

# Sync the repo with force to ensure a clean sync
/opt/crave/resync.sh

# cloning device tree
git clone https://github.com/daisy-mi-a2-lite/device_xiaomi_daisy.git device/xiaomi/daisy
git clone https://github.comxiaomi-msm8953-devs/android_device_xiaomi_msm8953-common.git device/xiaomi/msm8953-common

# cloning kernel tree
git clone https://github.com/xiaomi-msm8953-devs/android_kernel_xiaomi_msm8953.git kernel/xiaomi/msm8953

# cloning vendor tree
git clone https://github.com/xiaomi-msm8953-devs/proprietary_vendor_xiaomi_daisy.git vendor/xiaomi/daisy
git clone https://github.com/xiaomi-msm8953-devs/proprietary_vendor_xiaomi_msm8953-common.git vendor/xiaomi/msm8953-common

# cloning hardware tree
git clone https://github.com/LineageOS/android_hardware_xiaomi.git hardware/xiaomi

# Set up build environment
source build/envsetup.sh

# Set up th build environment
. build/envsetup.sh

# Choose the target device
lunch lineage_daisy-ap4a-userdebug

# Build the ROM (use mka bacon for a full build)
m evolution
