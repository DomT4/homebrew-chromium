class Chromium < Formula
   homepage "https://www.chromium.org/getting-involved/download-chromium"
   url "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Mac%2F311645%2Fchrome-mac.zip?generation=1421313283746000&alt=media"
   version "c311645"
   sha256 "c570fc1259b2c3729bbd305975e17c377dda650d182ae71e25f869fb8556cd78"

  def install
    prefix.install "Chromium.app"
  end
end
