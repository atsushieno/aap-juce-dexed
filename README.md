This is a port of [Dexed](https://github.com/asb2m10/dexed) to [aap-juce](https://github.com/atsushieno/aap-juce).

At this state the entire application is not well suited for use in Android in various aspects e.g. GUI is tailored only for desktop, and it assumes file accesses. There are even disabled code paths. Take it more like a conceptual port of an existing JUCE plugin at this state.

The port began as a Projucer-based project, but afterwards the original source has migrated to CMake, and we followed that too. We also used to have a completely different fork at atsushieno/dexed, but now we stick to the original repo.

# HACKING

This is how `aap-juce-support.patch` could be generated:

> git diff > ../../aap-juce-support.patch
> cd libs/tuning-library/ && git diff >> ../../../../aap-juce-support.patch && cd ../../
> cd libs/surgesynthteam_tuningui/ && git diff >> ../../../../aap-juce-support.patch && cd ../..

But that needs manual patch tweaks (which I ended up to do so, as the change is a few lines).
