# Copyright 2014 The Android Open Source Project
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

# Common config
include device/sony/common/CommonConfig.mk

# Sony AOSP Project
SONY_AOSP ?= true

# Custom boot image
TARGET_KERNEL_SOURCE := kernel/sony/msm
BOARD_CUSTOM_BOOTIMG := true
BOARD_KERNEL_SEPARATED_DT := true
BOARD_CUSTOM_BOOTIMG_MK := device/sony/common/boot/custombootimg.mk
TARGET_DTB_EXTRA_FLAGS := --force-v2
ifneq ($(filter kitakami kanuti yukon,$(SOMC_PLATFORM)),)
    TARGET_DTB_EXTRA_FLAGS := -2
endif

# Healthd
HEALTHD_FORCE_BACKLIGHT_CONTROL := true
HEALTHD_ENABLE_TRICOLOR_LED := true
RED_LED_PATH := /sys/class/leds/led:rgb_red/brightness
GREEN_LED_PATH := /sys/class/leds/led:rgb_green/brightness
BLUE_LED_PATH := /sys/class/leds/led:rgb_blue/brightness

# TWRP UI
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_NO_SEPARATE_RECOVERY := true
TW_NO_SCREEN_BLANK := true
TW_MAX_BRIGHTNESS := 4095
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_SECONDARY_BRIGHTNESS_PATH := /sys/class/leds/wled:backlight/brightness
RECOVERY_GRAPHICS_USE_LINELENGTH := true

# TWRP Storage
RECOVERY_SDCARD_ON_DATA := true
TW_INCLUDE_FUSE_EXFAT := true
TW_FLASH_FROM_STORAGE := true
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"

# TWRP Crypto
TW_INCLUDE_JB_CRYPTO := false
TW_INCLUDE_L_CRYPTO := true
TW_CRYPTO_FS_TYPE := "ext4"
TW_CRYPTO_MNT_POINT := "/data"
TW_CRYPTO_FS_OPTIONS := "nosuid,nodev,barrier=1,noauto_da_alloc,discard"
TW_CRYPTO_FS_FLAGS := "0x00000406"
TW_CRYPTO_KEY_LOC := "footer"
