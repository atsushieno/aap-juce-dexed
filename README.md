This is a refresh structuring of AAP-JUCE sample builder, specific to [Dexed](https://b.hatena.ne.jp/entry/s/github.com/asb2m10/dexed) port (which is actually using my fork for too many changes to patch).

`aap-juce` subdirectory right now contains files directly, but it will be the actual `aap-juce` repository contents once everything involved is sorted out. Until then, this repository is an ongoing hack.

This repository contains JUCE as a dependency, but it is not really necessary. For now it is there because of identical build scripts with AudioPluginHost port and other apps. It may change in the future because we don't want to have copy of JUCE repo for every templated aap-juce project.

