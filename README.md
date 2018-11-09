# Chromium Delivered Through Homebrew

## How to install Chromium from this tap

```bash
brew install domt4/chromium/chromium
```

And then updates will be picked up in the normal way:

```bash
brew update
brew upgrade
```

## Chrome Release Channel Tracking

It's not a completely hard rule but I try not to deviate too far from the
Canary channel. Generally updates will be no further apart than 14 days
here.

## Handling Homebrew's deprecation of linkapps

If people wish to use the Cask version of the formula in this tap
I have added one, which you can install via `brew cask install mac-chromium`.
Please note that you will need to `brew cask upgrade mac-chromium`
periodically.

## Duplication of the Caskroom's Chromium

When I created this repository the Caskroom distributed the portable,
Flash-enabled version of Chromium and I didn’t want that so I created this
tap instead.

In early November 2014 the Caskroom switched to using the direct downloads
from the Appspot blog, but due to the nature of these downloads the Caskroom
also disabled checksum verification of that cask, which isn't a risk I was
happy taking, personally.

The Caskroom’s cask also makes it painful for people to remain on up-to-date
Chromium versions, as Chromium ships with no built-in update method.

## Misc

This tap will never be used for anything other than Chromium.

For fun: When I started this repository on October the 8th 2014 Chromium was on
Commit Number 298608. Compare that to where we are today (!).
