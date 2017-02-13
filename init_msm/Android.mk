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

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_C_INCLUDES := system/core/init

LOCAL_CPPFLAGS := \
    -Wall \
    -Werror -Wno-error=deprecated-declarations \
    -Wno-unused-parameter \
    -DANDROID_TARGET=\"$(PRODUCT_PLATFORM)\"

ifneq ($(filter karin_windy ,$(TARGET_DEVICE)),)
LOCAL_CPPFLAGS += \
    -DVARIANT_GSM=0
endif

LOCAL_SRC_FILES := \
    init_msm.cpp \
    init_msm_platform.cpp

LOCAL_MODULE := libinit_msm

include $(BUILD_STATIC_LIBRARY)

