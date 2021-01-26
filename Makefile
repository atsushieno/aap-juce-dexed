# path to aap-juce directory.
AAP_JUCE_DIR=aap-juce

# path to application repo. The default is the submodule path.
APP_SRC_DIR=$(shell pwd)/external/dexed

# base app name
APP_NAME=Dexed

# app build directory name. Usually repo name is good.
APP_BUILD_DIR=$(shell pwd)/apps/dexed

# aap_metadata.xml source
AAP_METADATA_XML_SOURCE=$(shell pwd)/apps/aap_metadata.xml.Dexed

# diff file to app, generated by git diff. "-" if there is no patch.
PATCH_FILE=-

# diff depth, depending on the nested directory in the source tree, if patch exists.
PATCH_DEPTH=-

# Enable if it should skip metadata generator. Plugins need it, hosts don't.
# SKIP_METADATA_GENERATOR=0


include $(AAP_JUCE_DIR)/Makefile.common
