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

# Common path
COMMON_PATH := device/sony/common

# Headers path
TARGET_SPECIFIC_HEADER_PATH := $(COMMON_PATH)/include

# Override the default android_filesystem_config.h
TARGET_ANDROID_FILESYSTEM_CONFIG_H := \
    $(COMMON_PATH)/include/private/android_filesystem_config.h

# Also use headers from kernel during build process
TARGET_COMPILE_WITH_MSM_KERNEL := true

# Enforcing SELinux
BOARD_USE_ENFORCING_SELINUX := true

# Unified Device
TARGET_UNIFIED_DEVICE := true
TARGET_INIT_VENDOR_LIB := libinit_msm

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(COMMON_PATH)/releasetools

# Required for FMRadio
BOARD_HAVE_FM_RADIO := true
BOARD_DISABLE_FMRADIO_LIBJNI := true

# Common config
include $(COMMON_PATH)/CommonConfig.mk
include $(COMMON_PATH)/twrp.mk
