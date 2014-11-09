require "formula"

class Chromium < Formula
   homepage "https://www.chromium.org/"
   url "https://raw.githubusercontent.com/DomT4/LibreMirror/master/Chromium/Mac_303403_chrome-mac.zip"
   version "303403"
   sha256 "ff79ef0da87302152a0f733dbcfd238bd0b25f6d7e705539262c992308bf2b7e"

  # Why are we using your mirror instead of the core download link?
  # Answer - Because the core download link isn't wget or curl friendly.

  def install
    prefix.install "Chromium.app"
  end
end
