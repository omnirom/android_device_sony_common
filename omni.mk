# Copyright (C) 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Common path
COMMON_PATH := device/sony/common

# Sony AOSP Project
SONY_AOSP ?= true

# CarrierConfig overlay
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/omni/overlay/CarrierConfig

# Common kernel source
TARGET_KERNEL_SOURCE := kernel/sony/msm
TARGET_COMPILE_WITH_MSM_KERNEL := true

# SELinux
BOARD_USE_ENFORCING_SELINUX := false
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1
BOARD_SEPOLICY_DIRS += \
    vendor/omni/sepolicy

# Healthd
HEALTHD_FORCE_BACKLIGHT_CONTROL := true
HEALTHD_ENABLE_TRICOLOR_LED := true
RED_LED_PATH := /sys/class/leds/led:rgb_red/brightness
GREEN_LED_PATH := /sys/class/leds/led:rgb_green/brightness
BLUE_LED_PATH := /sys/class/leds/led:rgb_blue/brightness

TARGET_EXFAT_DRIVER := sdfat

# Command Line Tools
BOARD_INCLUDE_CMDLINE_TOOLS := true

# twrp
$(call inherit-product, $(COMMON_PATH)/recovery/twrp.mk)

# Omni config
$(call inherit-product, vendor/omni/config/common.mk)

# Widevine DRM
$(call inherit-product-if-exists, vendor/sony/widevine/widevine.mk)
