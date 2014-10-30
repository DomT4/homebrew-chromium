require "formula"

class Chromium < Formula
   homepage "https://www.chromium.org/"
   url "https://raw.githubusercontent.com/DomT4/LibreMirror/master/Chromium/Mac_302123_chrome-mac.zip"
   version "302123"
   sha256 "a2d465dc6646541b2d65de7904bbaef33fde0ca3bccb9f5de02d06d20d641411"

  # Why are we using your mirror instead of the core download link?
  # Answer - Because the core download link isn't wget or curl friendly.

  def install
    prefix.install "Chromium.app"
  end
end
