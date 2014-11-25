homebrew-chromium
=================

Chromium Snapshots Delivered Through Homebrew!

------

Yes, the [Caskroom/Brew-Cask](https://github.com/caskroom/homebrew-cask) does this sort of thing too.

However, when I created this repository they distributed the Portable, Flash-enabled version of Chromium and I didn’t want or need that.

In early November the Caskroom switched to using the direct downloads from the Appspot blog, but due to the nature of these downloads the Caskroom also disabled checksumming of that file for integrity, and I’d rather not punt that kind of risk when rocking a browser.

My method here allows myself or anyone to go back upstream, check the commit reference, download that binary zip themselves and checksum it. It also ensures that said binary did not change in transit between my Github mirror and arriving at Bert, Fred or Sandra’s Mac.

In the end, I’ve traded convenience for very slightly greater security, and I accept that compromise. If anyone else desires to, this repository is here for all.

And nope, this tap will never be used for anything other than Chromium. 

Alas, due to the Chromium upstream [download link](https://commondatastorage.googleapis.com/chromium-browser-snapshots/index.html) being curl & wget unfriendly, I’m having to pull the download from my mirror. If someone can find a way to get around having to do that, I’m open to suggestions!

How do I tap this repository?
--------------------------------
Just `brew tap domt4/chromium`.

It really is that simple. Yay! Fresh Chromium delivered regularly. Like bread, but less edible.