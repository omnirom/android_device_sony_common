LOCAL_PATH := $(call my-dir)

uncompressed_ramdisk := $(PRODUCT_OUT)/ramdisk.cpio
$(uncompressed_ramdisk): $(INSTALLED_RAMDISK_TARGET)
	@echo "----- Making uncompressed ramdisk ------"
	zcat $< > $@

recovery_uncompressed_device_ramdisk := $(PRODUCT_OUT)/ramdisk-recovery-device.cpio
$(recovery_uncompressed_device_ramdisk): $(MKBOOTFS) \
	$(INSTALLED_RAMDISK_TARGET) \
	$(INTERNAL_RECOVERYIMAGE_FILES) \
	$(recovery_initrc) $(recovery_sepolicy) $(recovery_kernel) \
	$(INSTALLED_2NDBOOTLOADER_TARGET) \
	$(recovery_build_prop) $(recovery_resource_deps) $(recovery_root_deps) \
	$(recovery_fstab) \
	$(RECOVERY_INSTALL_OTA_KEYS)
	$(call build-recoveryramdisk)
	@echo ----- Making uncompressed recovery ramdisk ------
	$(hide) $(MKBOOTFS) $(TARGET_RECOVERY_ROOT_OUT) > $@

$(INSTALLED_BOOTIMAGE_TARGET): \
    $(PRODUCT_OUT)/kernel \
    $(uncompressed_ramdisk) \
    $(recovery_uncompressed_device_ramdisk) \
    $(INSTALLED_RAMDISK_TARGET) \
    $(MKBOOTIMG) $(MINIGZIP) \
    $(INTERNAL_BOOTIMAGE_FILES)

	@echo -e ${CL_CYN}"----- Making boot image ------"${CL_RST}
	$(hide) rm -fr $(PRODUCT_OUT)/combinedroot*
	$(hide) cp -a $(PRODUCT_OUT)/root $(PRODUCT_OUT)/combinedroot
	$(hide) mkdir -p $(PRODUCT_OUT)/combinedroot/sbin
	$(hide) cp -n $(uncompressed_ramdisk) $(recovery_uncompressed_device_ramdisk)
	$(hide) cp $(recovery_uncompressed_device_ramdisk) $(PRODUCT_OUT)/combinedroot/sbin/ramdisk-recovery.cpio
	$(hide) $(MKBOOTFS) $(PRODUCT_OUT)/combinedroot/ > $(PRODUCT_OUT)/combinedroot.cpio
	$(hide) cat $(PRODUCT_OUT)/combinedroot.cpio | gzip > $(PRODUCT_OUT)/combinedroot.fs

	$(hide) $(MKBOOTIMG) \
        --kernel $(PRODUCT_OUT)/kernel \
        --ramdisk $(PRODUCT_OUT)/combinedroot.fs \
        --cmdline "$(BOARD_KERNEL_CMDLINE)" \
        --base $(BOARD_KERNEL_BASE) \
        --pagesize $(BOARD_KERNEL_PAGESIZE) \
        -o $(INSTALLED_BOOTIMAGE_TARGET)
	@echo -e ${CL_CYN}"Made boot image: $@"${CL_RST}
	$(hide) rm -fr $(recovery_uncompressed_device_ramdisk)
	$(hide) rm -fr $(PRODUCT_OUT)/combinedroot*

INSTALLED_RECOVERYIMAGE_TARGET := $(PRODUCT_OUT)/recovery.img
$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) $(recovery_ramdisk) $(recovery_kernel)
	@echo -e ${CL_CYN}"----- Making recovery image ------"${CL_RST}
	$(hide) $(MKBOOTIMG) \
        --kernel $(PRODUCT_OUT)/kernel \
        --ramdisk $(PRODUCT_OUT)/ramdisk-recovery.img \
        --cmdline "$(BOARD_KERNEL_CMDLINE)" \
        --base $(BOARD_KERNEL_BASE) \
        --pagesize $(BOARD_KERNEL_PAGESIZE) \
        -o $(INSTALLED_RECOVERYIMAGE_TARGET)
	@echo -e ${CL_CYN}"Made recovery image: $@"${CL_RST}
