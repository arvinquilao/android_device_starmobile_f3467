$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/starmobile/f3467/f3467-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

LOCAL_PATH := device/starmobile/f3467
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/prebuilt/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PACKAGES += Torch

PRODUCT_PACKAGES += \
    	libxlog

PRODUCT_PACKAGES += \
    	lights.mt6582

# audio
PRODUCT_PACKAGES += \
    	audio.r_submix.default

PRODUCT_PACKAGES += \
	audio.primary.mt6582

PRODUCT_PACKAGES += \
	audio_policy.default

PRODUCT_PACKAGES += \
    	lib_driver_cmd_mt66xx

PRODUCT_COPY_FILES += \
    	$(LOCAL_PATH)/rootdir/configs/mtk-kpd.kl:system/usr/keylayout/mtk-kpd.kl

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/rootdir/configs/agps_profiles_conf.xml:system/etc/agps_profiles_conf.xml

PRODUCT_COPY_FILES += \
    	$(LOCAL_PATH)/rootdir/root/fstab.mt6582:root/fstab.mt6582 \
    	$(LOCAL_PATH)/rootdir/root/init.recovery.mt6582.rc:root/init.recovery.mt6582.rc \
    	$(LOCAL_PATH)/rootdir/root/init.rc:root/init.rc \
    	$(LOCAL_PATH)/rootdir/root/init.mt6582.rc:root/init.mt6582.rc \
    	$(LOCAL_PATH)/rootdir/root/init.project.rc:root/init.project.rc \
    	$(LOCAL_PATH)/rootdir/root/factory_init.rc:root/factory_init.rc \
    	$(LOCAL_PATH)/rootdir/root/init.no_ssd.rc:root/init.no_ssd.rc \
    	$(LOCAL_PATH)/rootdir/root/init.modem.rc:root/init.modem.rc \
    	$(LOCAL_PATH)/rootdir/root/init.xlog.rc:root/init.xlog.rc \
    	$(LOCAL_PATH)/rootdir/root/ueventd.mt6582.rc:root/ueventd.mt6582.rc \
    	$(LOCAL_PATH)/rootdir/root/init.mt6582.usb.rc:root/init.mt6582.usb.rc \

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/rootdir/configs/android.hardware.microphone.xml:system/etc/permissions/android.hardware.microphone.xml \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.faketouch.xml:system/etc/permissions/android.hardware.faketouch.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml
	
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/rootdir/configs/media_codecs.xml:system/etc/media_codecs.xml \
	$(LOCAL_PATH)/rootdir/configs/media_profiles.xml:system/etc/media_profiles.xml \
	$(LOCAL_PATH)/rootdir/configs/audio_policy.conf:system/etc/audio_policy.conf \
	
$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_f3467
PRODUCT_DEVICE := f3467

PRODUCT_COPY_FILES_OVERRIDES += \
    	root/fstab.goldfish \
    	root/init.goldfish.rc \
    	recovery/root/fstab.goldfish

PRODUCT_PROPERTY_OVERRIDES += \
    	ro.cwm.forbid_format=/nvram,/uboot \
    	ro.mediatek.version.release=ALPS.W10.24.p0 \
	ro.mediatek.platform=MT6582 \
	ro.mediatek.chip_ver=S01 \
	ro.mediatek.version.branch=KK1.MP1 \
	ro.mediatek.version.sdk=2 \
	ro.telephony.sim.count=2 \
	ro.allow.mock.location=0 \
	ro.debuggable=1 \
	persist.sys.usb.config=mtp,adb \
	persist.service.adb.enable=1 \
	persist.service.debuggable=1 \
	persist.mtk.wcn.combo.chipid=-1

ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0 \
	ro.allow.mock.location=1 \
	persist.mtk.aee.aed=on \
	ro.adb.secure=0 \
	persist.service.acm.enable=0 \
	ro.bootloader.mode=download \
	ro.mount.fs=EXT4 \
	ro.persist.partition.support=no

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
