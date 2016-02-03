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

ifneq ($(filter rhine shinano shinano2 yukon kitakami kanuti, $(SOMC_PLATFORM)), )
BOARD_CUSTOM_BOOTIMG := true
BOARD_KERNEL_SEPARATED_DT := true
endif

ifneq ($(filter yukon kitakami kanuti, $(SOMC_PLATFORM)), )
TARGET_DTB_EXTRA_FLAGS := --force-v2
endif

ifneq ($(filter rhine shinano shinano2 yukon, $(SOMC_PLATFORM)), )
BOARD_CUSTOM_BOOTIMG_MK := device/sony/common/custombootimg_32.mk
endif
ifneq ($(filter kitakami kanuti, $(SOMC_PLATFORM)), )
BOARD_CUSTOM_BOOTIMG_MK := device/sony/common/custombootimg_64.mk
endif
