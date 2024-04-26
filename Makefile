
PWD=$(shell pwd)
AAP_JUCE_DIR=$(PWD)/external/aap-juce

APP_NAME=Dexed

APP_BUILD_DIR=$(PWD)
APP_SRC_DIR=$(PWD)/external/dexed
JUCE_DIR=$(APP_SRC_DIR)/libs/JUCE

APP_ICON=$(APP_SRC_DIR)/Resources/ui/dexedIcon.png

APP_SHARED_CODE_LIBS="Source/$(APP_NAME)_artefacts/lib$(APP_NAME)_SharedCode.a  Resources/libDexedResources.a"


PATCH_FILE=$(PWD)/aap-juce-support.patch
PATCH_DEPTH=1

include $(AAP_JUCE_DIR)/Makefile.cmake-common
