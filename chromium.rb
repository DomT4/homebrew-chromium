require "formula"

class Chromium < Formula
   homepage "https://www.chromium.org/"
   url "https://raw.githubusercontent.com/DomT4/LibreMirror/master/Chromium/Mac_299624_chrome-mac.zip"
   version "299624"
   sha256 "f917a317ab391a875a16c55c9f9e947ea9ae5f3bc135b053624c0ecdb7218575"

  # Why are we using your mirror instead of the core download link?
  # Answer - Because the core download link isn't wget or curl friendly.

  def install
    prefix.install "Chromium.app"
  end
end
