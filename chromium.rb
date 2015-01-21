class Chromium < Formula
   homepage "https://www.chromium.org/getting-involved/download-chromium"
   url "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Mac%2F312320%2Fchrome-mac.zip?generation=1421847228396000&alt=media"
   version "c312320"
   sha256 "2a78774c26d2a45f36946f3a490f1250dd928bc75479b5a0574e3fe759fafefd"

  def install
    prefix.install "Chromium.app"
  end
end
