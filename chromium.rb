class Chromium < Formula
  desc "An open-source web browser"
  homepage "https://www.chromium.org/getting-involved/download-chromium"
  url "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Mac%2F342569%2Fchrome-mac.zip?generation=1439160344725000&alt=media"
  version "c342569"
  sha256 "84a86a694af41ebba1d993e3569baa790955db7f7769218ae30bd93b7a93de20"

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
