TARGET := iphone::latest:7.0
ARCHS = arm64 arm64e
FINALPACKAGE = 1
THEOS_DEVICE_IP=192.168.168.100
THEOS_DEVICE_PORT=22

include $(THEOS)/makefiles/common.mk

LIBRARY_NAME = libsymbolize

libsymbolize_FILES = $(wildcard *.m)
libsymbolize_CFLAGS = -fobjc-arc
libsymbolize_FRAMEWORKS = CoreSymbolication
libsymbolize_LDFLAGS += -FFrameworks/
libsymbolize_INSTALL_PATH = /usr/local/lib

include $(THEOS_MAKE_PATH)/library.mk
