class Chromium < Formula
  homepage "https://www.chromium.org/getting-involved/download-chromium"
  url "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Mac%2F330650%2Fchrome-mac.zip?generation=1432078955731000&alt=media"
  version "c330650"
  sha256 "eacba0ac010a25fb90300bafb2722c554fa322698c354aa94e29b7ae99c61896"

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
