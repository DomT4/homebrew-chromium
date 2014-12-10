require "formula"

class Chromium < Formula
   homepage "https://www.chromium.org/getting-involved/download-chromium"
   url "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Mac%2F307649%2Fchrome-mac.zip?generation=1418195183117000&alt=media"
   version "c307649"
   sha256 "c2b5361188b9ed671883be10ce62e09674881d79639577240241581be0db2399"

  def install
    prefix.install "Chromium.app"
  end
end
