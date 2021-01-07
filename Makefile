
MINIMIZE_INTERMEDIATES=0
NDK_VERSION=21.2.6472646
JUCE_DIR=$(shell pwd)/external/JUCE
PROJUCER_BIN_LINUX=$(JUCE_DIR)/extras/Projucer/Builds/LinuxMakefile/build/Projucer
PROJUCER_BIN_DARWIN=$(JUCE_DIR)/extras/Projucer/Builds/MacOSX/build/Debug/Projucer.app/Contents/MacOS/Projucer
GRADLE_TASK=build

ifeq ($(shell uname), Linux)
	PROJUCER_BIN=$(PROJUCER_BIN_LINUX)
else
ifeq ($(shell uname), Darwin)
	PROJUCER_BIN=$(PROJUCER_BIN_DARWIN)
else
	PROJUCER_BIN=___error___
endif
endif


.PHONY:
all: build

.PHONY:
build: prepare build-aap build-samples

.PHONY:
prepare: build-projucer

.PHONY:
build-projucer: $(PROJUCER_BIN)
	@echo "Projucer target: $(PROJUCER_BIN)"

$(PROJUCER_BIN_LINUX):
	make -C $(JUCE_DIR)/extras/Projucer/Builds/LinuxMakefile
	if [ $(MINIMIZE_INTERMEDIATES) ] ; then \
		rm -rf $(JUCE_DIR)/extras/Projucer/Builds/LinuxMakefile/build/intermediate/ ; \
	fi

$(PROJUCER_BIN_DARWIN):
	xcodebuild -project $(JUCE_DIR)/extras/Projucer/Builds/MacOSX/Projucer.xcodeproj
	if [ $(MINIMIZE_INTERMEDIATES) ] ; then \
		rm -rf $(JUCE_DIR)/extras/Projucer/Builds/MacOSX/build/intermediate/ ; \
	fi

.PHONY:
build-aap:
	cd external/android-audio-plugin-framework && make MINIMIZE_INTERMEDIATES=$(MINIMIZE_INTERMEDIATES)

.PHONY:
build-samples: build-dexed

.PHONY:
dist:
	mkdir -p release-builds
	mv  apps/dexed/Builds/Android/app/build/outputs/apk/release_/release/app-release_-release.apk  release-builds/dexed-release.apk


.PHONY:
build-dexed: create-patched-dexed do-build-dexed
.PHONY:
do-build-dexed:
	echo "PROJUCER is at $(PROJUCER_BIN)"
	MINIMIZE_INTERMEDIATES=$(MINIMIZE_INTERMEDIATES) NDK_VERSION=$(NDK_VERSION) APPNAME=Dexed PROJUCER=$(PROJUCER_BIN) ANDROID_SDK_ROOT=$(ANDROID_SDK_ROOT) GRADLE_TASK=$(GRADLE_TASK) aap-juce/build-sample.sh apps/dexed/Dexed.jucer
.PHONY:
create-patched-dexed: apps/dexed/.stamp 
apps/dexed/.stamp: \
		external/dexed/** \
		apps/override.Dexed.jucer \
		aap-juce/sample-project.*
	aap-juce/create-patched-juce-app.sh  Dexed  external/dexed \
		apps/dexed  -  -  apps/override.Dexed.jucer

