class Chromium < Formula
   homepage "https://www.chromium.org/getting-involved/download-chromium"
   url "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Mac%2F309637%2Fchrome-mac.zip?generation=1419442650910000&alt=media"
   version "c309637"
   sha256 "02be4148a816fa8e0f4d07780ef5a339ddec8d2932d21397ca7cc14b62163c61"

  def install
    prefix.install "Chromium.app"
  end
end
