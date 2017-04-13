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

# Sony AOSP Project
SONY_AOSP ?= true

# Common path
COMMON_PATH := device/sony/common

# Common from upstream
$(call inherit-product, $(COMMON_PATH)/common.mk)

# cryptfs hw
PRODUCT_PACKAGES += \
    libcryptfs_hw

# Variant linking script
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/releasetools/updater.sh:utilities/updater.sh

# SELinux
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Exclude these from build.prop, they are set by libinit
PRODUCT_SYSTEM_PROPERTY_BLACKLIST := \
    ro.product.model \
    ro.product.device

# Omni custom config
$(call inherit-product, vendor/omni/config/common.mk)
