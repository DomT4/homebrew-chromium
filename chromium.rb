require "formula"

class Chromium < Formula
   homepage "https://www.chromium.org/"
   url "https://raw.githubusercontent.com/DomT4/LibreMirror/master/Chromium/Mac_298755_chrome-mac.zip"
   version "298755"
   sha256 "4124027eb91d8383fe0490369b8b033e332be278f999929756ab1d7bf8463523"

  # Why are we using your mirror instead of the core download link?
  # Answer - Because the core download link isn't wget or curl friendly.

  def install
    prefix.install "Chromium.app"
  end
end
