class Chromium < Formula
  desc "An open-source web browser"
  homepage "https://www.chromium.org/getting-involved/download-chromium"
  url "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Mac%2F339212%2Fchrome-mac.zip?generation=1437104708294000&alt=media"
  version "c339212"
  sha256 "0990f2b7a6d245bc2d95e4da9ca41a1f8f0de765860b0b8d6c8fc74bb22bf679"

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
