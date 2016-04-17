ifneq ($(filter yukon rhine shinano kanuti kitakami,$(SOMC_PLATFORM)),)

LOCAL_PATH := $(call my-dir)

include $(call all-makefiles-under,$(LOCAL_PATH))

endif
