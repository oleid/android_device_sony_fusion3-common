LOCAL_PATH := $(call my-dir)

ifeq ($(BOARD_VENDOR_PLATFORM),fusion3)
    # make trim area daemon work
    $(shell \
         chmod a+x $(LOCAL_PATH)/rootdir/sbin/*tad_static; \
         mkdir -p $(TARGET_ROOT_OUT_SBIN); \
         ln -sf /system/bin/ta2bin $(TARGET_ROOT_OUT_SBIN)/ta2bin )

    include $(call all-subdir-makefiles,$(LOCAL_PATH))

    $(shell mkdir -p $(TARGET_OUT_ETC)/firmware/wcd9310; \
        ln -sf /data/misc/audio/wcd9310_anc.bin \
        $(TARGET_OUT_ETC)/firmware/wcd9310/wcd9310_anc.bin; \
        ln -sf /data/misc/audio/mbhc.bin \
        $(TARGET_OUT_ETC)/firmware/wcd9310/wcd9310_mbhc.bin)
endif
