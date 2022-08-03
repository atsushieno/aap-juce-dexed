# Automatically generated makefile, created by the Projucer
# Don't edit this file! Your changes will be overwritten when you re-save the Projucer project!

cmake_minimum_required(VERSION 3.15)

PROJECT(JUCE_CMAKE_ANDROID_EXAMPLE
LANGUAGES C CXX
VERSION 0.0.1
)

# for clang-tidy(this enable to find system header files).
if(CMAKE_EXPORT_COMPILE_COMMANDS)
set(CMAKE_CXX_STANDARD_INCLUDE_DIRECTORIES ${CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES})
endif()

if ("${JUCE_DIR}" STREQUAL "")
get_filename_component(JUCE_DIR "../external/dexed/libs/JUCE" ABSOLUTE)
endif ()
get_filename_component(OBOE_DIR "${JUCE_DIR}/modules/juce_audio_devices/native/oboe" ABSOLUTE)
if ("${AAP_JUCE_DIR}" STREQUAL "")
get_filename_component(AAP_JUCE_DIR "../external/aap-juce" ABSOLUTE)
endif ()
if ("${AAP_DIR}" STREQUAL "")
get_filename_component(AAP_DIR "../external/android-audio-plugin-framework" ABSOLUTE)
endif ()

message("##### JUCE_DIR: " ${JUCE_DIR})
message("##### AAP_JUCE_DIR: " ${AAP_JUCE_DIR})
message("##### AAP_DIR: " ${AAP_DIR})


if (ANDROID)
add_definitions(
    "-DJUCE_ANDROID=1"
    "-DJUCE_ANDROID_API_VERSION=16"
    "-DJUCE_PUSH_NOTIFICATIONS=1" 
    "-DJUCE_PUSH_NOTIFICATIONS_ACTIVITY=\"com/rmsl/juce/JuceActivity\"" 
    "-DJUCE_USE_ANDROID_OBOE=0"
    )

# Enable these lines if you use juce_audio_devices API
set(JUCE_USE_ANDROID_OBOE 0)
set(OBOE_DIR "${JUCE_DIR}/modules/juce_audio_devices/native/oboe")
#add_subdirectory (${OBOE_DIR} ./oboe)

# libcpufeatures

add_library("cpufeatures" STATIC "${ANDROID_NDK}/sources/android/cpufeatures/cpu-features.c")
set_source_files_properties("${ANDROID_NDK}/sources/android/cpufeatures/cpu-features.c" PROPERTIES COMPILE_FLAGS "-Wno-sign-conversion -Wno-gnu-statement-expression")

enable_language(ASM)

endif (ANDROID)

# build App code (e.g. libExamplePlugin_Standalone.so)

add_subdirectory("../external/dexed" ./dexed)

if (ANDROID)

add_library(juce_jni
    SHARED
    dummy.cpp
    )

target_link_libraries(juce_jni
    ${target_name}
)

target_compile_options(Dexed PRIVATE "-fsigned-char" )

endif (ANDROID)
