require "formula"

class Chromium < Formula
   homepage "https://www.chromium.org/"
   url "https://raw.githubusercontent.com/DomT4/LibreMirror/master/Chromium/Mac_304131_chrome-mac.zip"
   version "304131"
   sha256 "c3344ceee3991636064b56f625e67deecdfe3e437a36998d533214204d69c5bd"

  # Why are we using your mirror instead of the core download link?
  # Answer - Because the core download link isn't wget or curl friendly.
  # Please feel free to PR if you have a better way of handling that.

  def install
    prefix.install "Chromium.app"
  end
end
