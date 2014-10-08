homebrew-chromium
=================

Chromium Snapshots Delivered Through Homebrew!

------

Yes, the [Caskroom/Brew-Cask](https://github.com/caskroom/homebrew-cask) does this sort of thing too, but they distribute the portable, flash-enabled version of Chromium.

I'm not interested in Flash.

I also like my Chromium fresh off the press, direct from upstream, with no auto-updating method or any guarantee of not crashing horribly.

No, I'm not joking.

Frankly, If I'm already going to the trouble of maintaining this sort of setup for me I may as well make it easier for everyone else as well.

And no, this tap will never be used for anything other than Chromium.

Alas, due to the Chromium upstream [download link](https://commondatastorage.googleapis.com/chromium-browser-snapshots/index.html) being curl & wget unfriendly, I’m having to pull the download from my mirror. If someone can find a way to get around having to do that, I’m open to suggestions!

No Linux support for now. If there’s demand for it I may look at trying to work in Linux support. Only OS X for now.

How do I tap this repository?
--------------------------------
Just `brew tap domt4/chromium`.

It really is that simple. Yay! Fresh Chromium delivered as regularly as they push it. Like bread, but less edible.
