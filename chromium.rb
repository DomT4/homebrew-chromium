require "formula"

class Chromium < Formula
   homepage "https://www.chromium.org/getting-involved/download-chromium"
   url "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Mac%2F309316%2Fchrome-mac.zip?generation=1419041592863000&alt=media"
   version "c309316"
   sha256 "4c10e1c2614ee159b374a7649c9ddd8ef52ca16ba704158a4cf97fbca1e8d2cc"

  def install
    prefix.install "Chromium.app"
  end
end
