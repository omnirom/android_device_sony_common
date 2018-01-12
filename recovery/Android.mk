LOCAL_PATH := $(call my-dir)

# TWRP fstab
include $(CLEAR_VARS)
LOCAL_MODULE := twrp.fstab
LOCAL_SRC_FILES := twrp.fstab
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_STEM := twrp.fstab
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/etc
include $(BUILD_PREBUILT)
