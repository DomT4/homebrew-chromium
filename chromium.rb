class Chromium < Formula
  homepage "https://www.chromium.org/getting-involved/download-chromium"
  url "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Mac%2F323904%2Fchrome-mac.zip?generation=1428326838155000&alt=media"
  version "c323904"
  sha256 "dc44b2f37862164feeaeb096777f083f5793da40f5e1c2ac432250fde7a96740"

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
