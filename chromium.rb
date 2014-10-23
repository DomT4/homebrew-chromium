require "formula"

class Chromium < Formula
   homepage "https://www.chromium.org/"
   url "https://raw.githubusercontent.com/DomT4/LibreMirror/master/Chromium/Mac_300800_chrome-mac.zip"
   version "300800"
   sha256 "af86dff5c34c5685767d4dfdd80e824684b45c9805337a7e00529ed2d28c8217"

  # Why are we using your mirror instead of the core download link?
  # Answer - Because the core download link isn't wget or curl friendly.

  def install
    prefix.install "Chromium.app"
  end
end
