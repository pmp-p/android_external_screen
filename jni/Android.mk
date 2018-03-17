TARGET_PLATFORM := android-19

LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_LDFLAGS := -fPIE -Wl,--no-merge-exidx-entries

LOCAL_ARM_MODE   := arm

VERSION =\"4.1.0\"
MY_PREFIX := $(LOCAL_PATH)/src/
MY_SOURCES := $(wildcard $(MY_PREFIX)/*.c)
#LOCAL_SRC_FILES += $(MY_SOURCES:$(MY_PREFIX)%=%)

MY_FILES := $(wildcard $(LOCAL_PATH)/src/*.c)
MY_FILES := $(MY_FILES:$(LOCAL_PATH)/%=%)
LOCAL_SRC_FILES += $(MY_FILES)
#LOCAL_SRC_FILES += $(wildcard *.c)
#LOCAL_SRC_FILES += $(foreach F, $(APP_SUBDIRS), $(addprefix $(F)/,$(notdir $(wildcard $(LOCAL_PATH)/$(F)/*.c))))

LOCAL_MODULE:= screen
LOCAL_MODULE_TAGS := eng debug

#
#LOCAL_JNI_SHARED_LIBRARIES:= ncursesw
#LOCAL_LDLIBS += -L$(LOCAL_PATH)/../prebuilt/$(TARGET_ARCH_ABI) -lncursesw
LOCAL_LDLIBS += $(LOCAL_PATH)/../prebuilt/$(TARGET_ARCH_ABI)/libncursesw.a

LOCAL_C_INCLUDES := $(LOCAL_PATH)/src

LOCAL_CFLAGS := -fexceptions -funwind-tables -g -O2 -Dandroid -DSCREENENCODINGS=\"/data/data/u.r/share/utf8encodings\" \
-DGIT_REV=\"`git describe --always 2>/dev/null`\" \
-DSCREEN=\"screen-$(VERSION)\"

include $(BUILD_EXECUTABLE)
