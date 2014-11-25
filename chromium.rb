require "formula"

class Chromium < Formula
   homepage "https://www.chromium.org/"
   url "https://raw.githubusercontent.com/DomT4/LibreMirror/master/Chromium/Mac_305663_chrome-mac.zip"
   version "c305663"
   sha256 "747aacf1f29360a3803c50a0158a40f0aae0e6b479a6e2b5687f50d97fc23278"

  # Why are we using your mirror instead of the core download link?
  # Answer - Because the core download link isn't wget or curl friendly.
  # Please feel free to PR if you have a better way of handling that.

  def install
    prefix.install "Chromium.app"
  end
end
