Chromium Snapshots Delivered Through Homebrew!
=================

How do I tap this repository?
--------------------------------
Just `brew tap domt4/chromium`.

It really is that simple. Yay! Fresh Chromium delivered regularly. Like bread,
but less edible.

Handling Homebrew's deprecation of linkapps:
--------------------------------
Without getting into Homebrew politics I think this is a fairly backwards move
by Homebrew, especially given there is no way to upgrade a Cask
[currently](https://github.com/Homebrew/brew/pull/1523) without manually
reinstalling it. I have added some caveats to `brew info chromium` about the two
potential ways to handle it if you wish to remain with this tap once `linkapps`
is removed entirely at some future date.

Nonetheless, if people wish to use the Cask version of the formula in this tap
I have added one, which you can install via `brew cask install mac-chromium`.
Please note that you will need to `brew cask reinstall mac-chromium` periodically
until Homebrew upstream work out some auto-update mechanism.

What's your problem with just using the Caskroom's Chromium?
--------------------------------
Yes, the [Caskroom](https://github.com/caskroom/homebrew-cask) does this sort of
thing too. However, when I created this repository they distributed the portable,
Flash-enabled version of Chromium and I didn’t want or need that. In early
November 2014 the Caskroom switched to using the direct downloads from the
Appspot blog, but due to the nature of these downloads the Caskroom also
disabled checksumming of that file for integrity, which isn't a risk I love.

The Caskroom’s formula also makes it painful for people to remain on up-to-date
Chromium versions, as Chromium ships with no built-in update method.

Misc:
--------------------------------
This tap will never be used for anything other than Chromium. 

For fun: When I started this repository on October the 8th 2014 Chromium was on
Commit Number 298608. Compare that to where we are today (!).
