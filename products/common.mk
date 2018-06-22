# Generic product
PRODUCT_NAME := pixen
PRODUCT_BRAND := pixen
PRODUCT_DEVICE := generic

PIXEN_BUILD_DATE := $(shell date -u +%Y%m%d-%H%M)

EXCLUDE_SYSTEMUI_TESTS := true

PRODUCT_BUILD_PROP_OVERRIDES := BUILD_DISPLAY_ID=$(TARGET_PRODUCT)-$(PLATFORM_VERSION)-$(BUILD_ID)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.setupwizard.network_required=false \
    ro.setupwizard.gservices_delay=-1 \
    ro.com.android.dataroaming=false \
    drm.service.enabled=true \
    net.tethering.noprovisioning=true \
    persist.sys.dun.override=0 \
    ro.build.selinux=1 \
    ro.adb.secure=0 \
    ro.setupwizard.rotation_locked=true \
    ro.opa.eligible_device=true \
    persist.sys.disable_rescue=true \
    ro.config.calibration_cad=/system/etc/calibration_cad.xml

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    org.pixen.fingerprint=$(PLATFORM_VERSION)-$(BUILD_ID)-$(PIXEN_BUILD_DATE)

PRODUCT_DEFAULT_PROPERTY_OVERRIDES := \
    ro.adb.secure=0 \
    ro.secure=0 \
    persist.service.adb.enable=1

# Common overlay
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/pixen/overlay/common
DEVICE_PACKAGE_OVERLAYS += vendor/pixen/overlay/common

# Fix Dialer
PRODUCT_COPY_FILES +=  \
    vendor/pixen/prebuilt/common/etc/sysconfig/dialer_experience.xml:system/etc/sysconfig/dialer_experience.xml

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Latin IME lib - gesture typing
ifeq ($(TARGET_ARCH),arm64)
PRODUCT_COPY_FILES += \
    vendor/pixen/prebuilt/common/lib64/libjni_latinimegoogle.so:system/lib64/libjni_latinimegoogle.so \
    vendor/pixen/prebuilt/common/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so
else
PRODUCT_COPY_FILES += \
    vendor/pixen/prebuilt/common/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so
endif

# APN
PRODUCT_COPY_FILES += \
    vendor/pixen/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

# AR
PRODUCT_COPY_FILES += \
    vendor/pixen/prebuilt/common/etc/calibration_cad.xml:system/etc/calibration_cad.xml

# Extra packages
PRODUCT_PACKAGES += \
    Launcher3 \
    Stk \
    Terminal

# Init.d script support
PRODUCT_COPY_FILES += \
    vendor/pixen/prebuilt/common/bin/sysinit:system/bin/sysinit \
    vendor/pixen/prebuilt/common/etc/init/pixen-system.rc:system/etc/init/pixen-system.rc \
    vendor/pixen/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/pixen/prebuilt/common/addon.d/50-pixen.sh:system/addon.d/50-pixen.sh \
    vendor/pixen/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/pixen/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions

# Boot animations
$(call inherit-product-if-exists, vendor/pixen/products/bootanimation.mk)

# Themes Dark
PRODUCT_PACKAGES += \
    GBoardDarkTheme \
    SettingsDarkTheme \
    SystemDarkTheme \
    SystemUIDarkTheme

# Themes Black
PRODUCT_PACKAGES += \
    SettingsBlackTheme \
    SystemBlackTheme \
    SystemUIBlackTheme

# Overlays
PRODUCT_PACKAGES += \
    AmberAccent \
    BlackAccent \
    BlueAccent \
    BlueGreyAccent \
    BrownAccent \
    CyanAccent \
    DeepOrangeAccent \
    DeepPurpleAccent \
    DuiDark \
    GBoardDark \
    GreenAccent \
    GreyAccent \
    IndigoAccent \
    LightBlueAccent \
    LightGreenAccent \
    LimeAccent \
    OrangeAccent \
    PinkAccent \
    PurpleAccent \
    RedAccent \
    SettingsDark \
    SystemDark \
    TealAccent \
    YellowAccent \
    WhiteAccent
