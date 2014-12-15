require "formula"

class Chromium < Formula
   homepage "https://www.chromium.org/getting-involved/download-chromium"
   url "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Mac%2F308312%2Fchrome-mac.zip?generation=1418621041784000&alt=media"
   version "c308312"
   sha256 "da009e36c1153b153e2686c901724217dfcf136a6b9bc0e11eb6abd0f9a129c9"

  def install
    prefix.install "Chromium.app"
  end
end
