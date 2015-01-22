class Chromium < Formula
   homepage "https://www.chromium.org/getting-involved/download-chromium"
   url "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Mac%2F312494%2Fchrome-mac.zip?generation=1421887304160000&alt=media"
   version "c312494"
   sha256 "6be2f9287460fee7ee15b153665c8d14b08a1fa8b6757eb6449aea3928cb117e"

  def install
    prefix.install "Chromium.app"
  end
end
