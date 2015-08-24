class Chromium < Formula
  desc "An open-source web browser"
  homepage "https://www.chromium.org/getting-involved/download-chromium"
  url "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Mac%2F345070%2Fchrome-mac.zip?generation=1440431227918000&alt=media"
  version "c345070"
  sha256 "00a3e573cd47e6ef0794e0a233342a47535cbd2dc5b682757330a1988d421ccf"

  option "with-exec-script", "Installs an exec script for easy CLI opening of Chromium"

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
