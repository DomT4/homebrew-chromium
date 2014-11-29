require "formula"

class Chromium < Formula
   homepage "https://www.chromium.org/"
   url "https://raw.githubusercontent.com/DomT4/LibreMirror/master/Chromium/Mac_306113_chrome-mac.zip"
   version "c306113"
   sha256 "24ed58bf996a6e50acef8fdc7791ca1aeaca7b91fa7ba76dd7dff9551ec50cbf"

  # Why are we using your mirror instead of the core download link?
  # Answer - Because the core download link isn't wget or curl friendly.
  # Please feel free to PR if you have a better way of handling that.

  def install
    prefix.install "Chromium.app"
  end
end
