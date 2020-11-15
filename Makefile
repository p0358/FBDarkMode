ARCHS = arm64 arm64e
INSTALL_TARGET_PROCESSES = Facebook

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = FBDarkMode

FBDarkMode_FILES = Tweak.x
FBDarkMode_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
