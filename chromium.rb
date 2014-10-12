require "formula"

class Chromium < Formula
   homepage "https://www.chromium.org/"
   url "https://raw.githubusercontent.com/DomT4/LibreMirror/master/Chromium/Mac_299253_chrome-mac.zip"
   version "299253"
   sha256 "3eb6224cec4c31de020c458a9e3009f17fdf84a2c08ddf6f72815c2a153da049"

  # Why are we using your mirror instead of the core download link?
  # Answer - Because the core download link isn't wget or curl friendly.

  def install
    prefix.install "Chromium.app"
  end
end
