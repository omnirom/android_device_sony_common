LOCAL_PATH := $(call my-dir)

# TWRP fstab
include $(CLEAR_VARS)
LOCAL_MODULE := twrp.fstab
ifeq ($(AB_OTA_UPDATER),true)
LOCAL_SRC_FILES := twrp_ab.fstab
else
LOCAL_SRC_FILES := twrp.fstab
endif
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_STEM := twrp.fstab
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/etc
include $(BUILD_PREBUILT)

# Common USB setup
include $(CLEAR_VARS)
LOCAL_MODULE := init.recovery.usb
LOCAL_SRC_FILES := init.recovery.usb.rc
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_STEM := init.recovery.usb
LOCAL_MODULE_SUFFIX := .rc
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)
