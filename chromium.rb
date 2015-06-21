class Chromium < Formula
  desc "An open-source web browser"
  homepage "https://www.chromium.org/getting-involved/download-chromium"
  url "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Mac%2F335457%2Fchrome-mac.zip?generation=1434917601889000&alt=media"
  version "c335457"
  sha256 "691480709ec76e416c5e5c66ab213da4b0b532f287cc3793f25f1ed03fc792a1"

  option "with-exec-script", "Installs an exec script for easy CLI opening of Chromium"

  def install
    libexec.install "Chromium.app"

    if build.with? "exec-script"
      exec_script = bin+"chromium"
      exec_script.write <<-EOS.undent
        #!/usr/bin/env bash
        exec open -a "Chromium" "$@"
      EOS
      exec_script.chmod 0755
    end
  end
end
