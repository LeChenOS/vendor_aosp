PRODUCT_COPY_FILES += \
    vendor/pixen/utils/emulator/fstab.ranchu:vendor/etc/fstab.ranchu \
    vendor/pixen/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

$(call inherit-product, build/target/product/sdk_x86.mk)

$(call inherit-product, vendor/pixen/utils/emulator/common.mk)

# Override product naming for pixen
PRODUCT_NAME := pixen_emulator

DEVICE_PACKAGE_OVERLAYS += vendor/pixen/utils/emulator/overlay

ALLOW_MISSING_DEPENDENCIES := true 
