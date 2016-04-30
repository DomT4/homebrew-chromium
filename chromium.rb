class Chromium < Formula
  desc "Open-source web browser"
  homepage "https://www.chromium.org/getting-involved/download-chromium"
  url "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Mac%2F390859%2Fchrome-mac.zip?generation=1462044587904000&alt=media"
  version "c390859"
  sha256 "d088d16db9331160a3ec35a2baef758188354b175ccbf387795be010a4b67a6d"

  option "with-exec-script", "Install a script for easy CLI opening of Chromium"

  def install
    libexec.install "Chromium.app"

    if build.with? "exec-script"
      exec_script = bin/"chromium"
      exec_script.write <<-EOS.undent
        #!/usr/bin/env bash
        exec open -a "Chromium" "$@"
      EOS
      exec_script.chmod 0755
    end
  end
end
