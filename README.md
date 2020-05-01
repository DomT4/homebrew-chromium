# Chromium Delivered Through Homebrew

## How to install Chromium from this tap

*via Formula:*

```bash
brew install domt4/chromium/chromium
```

*via Cask:*

```bash
brew cask install domt4/chromium/mac-chromium
```

And then updates will be picked up in the normal way:

```bash
brew update
brew upgrade
```

## Chrome Release Channel Tracking

Generally updates will be no further apart than 14 days here. The aim is
to update infrequently enough to provide some stability whilst not updating so
infrequently that this tap slips behind important/interesting security/feature
releases.

## Duplication of Homebrew Cask's Chromium

When I created this repository Homebrew Cask distributed the portable,
Flash-enabled version of Chromium and I didn’t want to use/support Flash
and its myriad of frequent security issues so I created this tap instead.

In November 2014 Homebrew Cask switched to using the direct downloads
from the Appspot blog, but due to the nature of these downloads Homebrew Cask
also disabled checksum verification of that cask, which isn't a risk I was
happy taking.

In [early 2019](https://github.com/Homebrew/homebrew-cask/commit/7af98a34ae)
Homebrew Cask moved to checksummed and versioned Chromium releases,
nigh identically to the way this tap was setup to support. The Cask in this
tap has been updated with caveats on how to migrate over if people wish to,
but this tap will remain supported for the foreseeable.

## Misc

When I started this repository on October 8th 2014 Chromium was on
Commit Number 298608.
