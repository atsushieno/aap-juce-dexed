This is a port of [Dexed](https://github.com/asb2m10/dexed) to [aap-juce](https://github.com/atsushieno/aap-juce). (It is actually using my fork for too many changes to patch). See aap-juce README for what it is.

At this state the entire application is not well suited for use in Android, as it is no more than a mere port. There are even, disabled code paths. Take it more like a conceptual port of an existing JUCE plugin at this state.

This repository contains JUCE as a dependency, but it is not really necessary. For now it is there because of identical build scripts with AudioPluginHost port and other apps. It may change in the future because we don't want to have copy of JUCE repo for every templated aap-juce project.

# HACKING

This is how `aap-juce-support.patch` could be generated:

> git diff > ../../aap-juce-support.patch
> cd libs/tuning-library/ && git diff >> ../../../../aap-juce-support.patch && cd ../../
> cd libs/surgesynthteam_tuningui/ && git diff >> ../../../../aap-juce-support.patch && cd ../..

But that needs manual patch tweaks (which I ended up to do so, as the change is a few lines).
