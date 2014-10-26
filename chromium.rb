require "formula"

class Chromium < Formula
   homepage "https://www.chromium.org/"
   url "https://raw.githubusercontent.com/DomT4/LibreMirror/master/Chromium/Mac_301305_chrome-mac.zip"
   version "301305"
   sha256 "ff8b6e526c7469be892b82f7c322a55bc8a185361247f9feef94184a3e445d79"

  # Why are we using your mirror instead of the core download link?
  # Answer - Because the core download link isn't wget or curl friendly.

  def install
    prefix.install "Chromium.app"
  end
end
