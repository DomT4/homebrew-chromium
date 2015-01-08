class Chromium < Formula
   homepage "https://www.chromium.org/getting-involved/download-chromium"
   url "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Mac%2F310447%2Fchrome-mac.zip?generation=1420690486142000&alt=media"
   version "c310447"
   sha256 "8c9ca402d5d8080c11b5d9826f683c12868741b4e573df4740b8a89470272634"

  def install
    prefix.install "Chromium.app"
  end
end
