class Chromium < Formula
   homepage "https://www.chromium.org/getting-involved/download-chromium"
   url "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Mac%2F309773%2Fchrome-mac.zip?generation=1419972657845000&alt=media"
   version "c309773"
   sha256 "a11b2274ab1d3f34a7fb68aa4704e6a6cf0db175b78967133f63f137ecddbf19"

  def install
    prefix.install "Chromium.app"
  end
end
