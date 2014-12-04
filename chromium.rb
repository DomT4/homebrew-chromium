require "formula"

class Chromium < Formula
   homepage "https://www.chromium.org/getting-involved/download-chromium"
   url "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Mac%2F306902%2Fchrome-mac.zip?generation=1417733154353000&alt=media"
   version "c306902"
   sha256 "02f57554720c7a3f1428f23a721b6e2ac718b94f05e2719ec1289924e6aef7ec"

  def install
    prefix.install "Chromium.app"
  end
end
