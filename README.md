This is a port of [Dexed](https://github.com/asb2m10/dexed) to [aap-juce](https://github.com/atsushieno/aap-juce).

It is the most commonly experimented aap-juce application that I @atsushieno uses for development as Dexed offers presets on VST3, AU, and LV2.

## Build

Run `./gradlew build` (`gradlew.bat build` on Windows). The shared aap-juce
preparation task applies the application patch, selects JUCE patches by version,
and stages the launcher icon before native configuration, Java compilation, and
lint. Existing patches are adopted without resetting the source checkouts.

Port configuration and aap-juce calls are included in the upstream
`CMakeLists.txt` through `aap-juce-support.patch`. Gradle retains the
`src/main/cpp/CMakeLists.txt` reference through the existing source-directory
symlink, which accommodates Android Studio's CMake path-resolution limits.
The existing Makefile remains available. Maven dependencies must be published or otherwise resolvable;
for local aap-core development, its existing `publishToMavenLocal` workflow is
still available through Make. `make dist` still collects built APK/AAB files.

