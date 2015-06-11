class Chromium < Formula
  desc "Chromium is an open-source browser"
  homepage "https://www.chromium.org/getting-involved/download-chromium"
  url "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Mac%2F333893%2Fchrome-mac.zip?generation=1433999222898000&alt=media"
  version "c333893"
  sha256 "4023f6eec19c8dd7fcce22b924f35100270a07a8cb9500d3e8eb9a5f4f29ed12"

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
