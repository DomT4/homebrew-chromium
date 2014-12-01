require "formula"

class Chromium < Formula
   homepage "https://www.chromium.org/"
   url "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Mac%2F306256%2Fchrome-mac.zip\?generation\=1417472541013000\&alt\=media"
   version "c306256"
   sha256 "8f2bbab1583f6b6153bcbcac3e3539d3ecb600f861af9de04c57f8fdbeef1926"

  def install
    prefix.install "Chromium.app"
  end
end
