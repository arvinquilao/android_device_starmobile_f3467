## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := f3467

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/starmobile/f3467/device_f3467.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := f3467
PRODUCT_NAME := cm_f3467
PRODUCT_BRAND := Starmobile
PRODUCT_MODEL := SKY
PRODUCT_MANUFACTURER := Starmobile
