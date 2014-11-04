require "formula"

class Chromium < Formula
   homepage "https://www.chromium.org/"
   url "https://raw.githubusercontent.com/DomT4/LibreMirror/master/Chromium/Mac_302570_chrome-mac.zip"
   version "302570"
   sha256 "ec519aaa96822b66850d5856f00699430f54c462cf0124f963f7ae180915a525"

  # Why are we using your mirror instead of the core download link?
  # Answer - Because the core download link isn't wget or curl friendly.

  def install
    prefix.install "Chromium.app"
  end
end
