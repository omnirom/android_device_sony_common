ifneq ($(CUSTOM_BUILD),)
# Board platforms lists to be used for
# TARGET_BOARD_PLATFORM specific featurization
QCOM_BOARD_PLATFORMS += msm8952 msm8996 msm8998 sdm660 sdm845

#List of targets that use video hw
MSM_VIDC_TARGET_LIST := msm8952 msm8996 msm8998 sdm660 sdm845

#List of targets that use master side content protection
MASTER_SIDE_CP_TARGET_LIST := msm8996 msm8998 sdm660 sdm845

audio-hal := hardware/sony/audio
gps-hal := hardware/sony/gps/sdm845

ifeq ($(TARGET_USES_SDE),true)
display-hal := hardware/sony/display-sde
QCOM_MEDIA_ROOT := hardware/sony/media/sdm845
else
display-hal := hardware/sony/display
QCOM_MEDIA_ROOT := hardware/sony/media/msm8998
endif

OMX_VIDEO_PATH := mm-video-v4l2
media-hal := $(QCOM_MEDIA_ROOT)

SRC_CAMERA_HAL_DIR ?= hardware/sony/camera
SRC_DISPLAY_HAL_DIR := $(display-hal)
SRC_MEDIA_HAL_DIR := $(QCOM_MEDIA_ROOT)
TARGET_KERNEL_VERSION := $(SOMC_KERNEL_VERSION)

include device/sony/common/hardware/qcom/utils.mk

#include $(display-hal)/Android.mk
include $(call all-makefiles-under,$(audio-hal))
include $(call all-makefiles-under,$(gps-hal))
include $(call all-makefiles-under,$(media-hal))
endif
