ARCHS = arm64
TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = taCode

include $(THEOS)/makefiles/common.mk

APPLICATION_NAME = taCode

taCode_FILES = main.m TACOAppDelegate.m TACORootViewController.m
taCode_FRAMEWORKS = UIKit CoreGraphics
taCode_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/application.mk
