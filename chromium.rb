require "formula"

class Chromium < Formula
   homepage "https://www.chromium.org/"
   url "https://raw.githubusercontent.com/DomT4/LibreMirror/master/Chromium/Mac_303050_chrome-mac.zip"
   version "303050"
   sha256 "63da067cca5f792d4c56203319a92ec2ffde6ddfbcf9e94dbbfbb0cbf5dc8cac"

  # Why are we using your mirror instead of the core download link?
  # Answer - Because the core download link isn't wget or curl friendly.

  def install
    prefix.install "Chromium.app"
  end
end
