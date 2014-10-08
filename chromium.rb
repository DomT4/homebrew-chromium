require "formula"

class Chromium < Formula
   homepage "https://www.chromium.org/"
   url "https://raw.githubusercontent.com/DomT4/LibreMirror/master/Chromium/Mac_298608_chrome-mac.zip"
   version "298608"
   sha256 "5de10a0bd0d5c8cebded73f0ee9ebd6aafc6766b7f711b1bbeef23865ab400c6"

  # Why are we using your mirror instead of the core download link?
  # Answer - Because the core download link isn't wget or curl friendly.

  def install
    prefix.install "Chromium.app"
  end
end
