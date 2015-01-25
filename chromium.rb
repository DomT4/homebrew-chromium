class Chromium < Formula
  homepage "https://www.chromium.org/getting-involved/download-chromium"
  url "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Mac%2F313032%2Fchrome-mac.zip?generation=1422140101566000&alt=media"
  version "c313032"
  sha256 "de0e36a9c3ddef67a5bbd57c6db493bdd6b1289df6e57ba1a9852a9d5084378d"

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
