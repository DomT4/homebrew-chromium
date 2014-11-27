require "formula"

class Chromium < Formula
   homepage "https://www.chromium.org/"
   url "https://raw.githubusercontent.com/DomT4/LibreMirror/master/Chromium/Mac_306025_chrome-mac.zip"
   version "c306025"
   sha256 "a4e022d33cb8dba5d53f78a5ea8fef5275c3072832f4c1968347d5e96fb263fd"

  # Why are we using your mirror instead of the core download link?
  # Answer - Because the core download link isn't wget or curl friendly.
  # Please feel free to PR if you have a better way of handling that.

  def install
    prefix.install "Chromium.app"
  end
end
