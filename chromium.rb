require "formula"

class Chromium < Formula
   homepage "https://www.chromium.org/"
   url "https://raw.githubusercontent.com/DomT4/LibreMirror/master/Chromium/Mac_300225_chrome-mac.zip"
   version "300225"
   sha256 "9a15cfb1b98e9675cf9a0abaea51751fb715824675fce318d8f57fd2af256ad9"

  # Why are we using your mirror instead of the core download link?
  # Answer - Because the core download link isn't wget or curl friendly.

  def install
    prefix.install "Chromium.app"
  end
end
