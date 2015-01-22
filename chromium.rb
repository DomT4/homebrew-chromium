class Chromium < Formula
   homepage "https://www.chromium.org/getting-involved/download-chromium"
   url "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Mac%2F312675%2Fchrome-mac.zip?generation=1421962006063000&alt=media"
   version "c312675"
   sha256 "85ab120d94087243e731087f74b1569bb81fa24a2acbde71871ef20fd29a70ef"

  def install
    prefix.install "Chromium.app"
  end
end
