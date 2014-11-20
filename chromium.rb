require "formula"

class Chromium < Formula
   homepage "https://www.chromium.org/"
   url "https://raw.githubusercontent.com/DomT4/LibreMirror/master/Chromium/Mac_304935_chrome-mac.zip"
   version "c304935"
   sha256 "30195be3efaf11fe18c06b387595215f915367a29aa85abefcdb0ff1a9829da4"

  # Why are we using your mirror instead of the core download link?
  # Answer - Because the core download link isn't wget or curl friendly.
  # Please feel free to PR if you have a better way of handling that.

  def install
    prefix.install "Chromium.app"
  end
end
