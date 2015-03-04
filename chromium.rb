class Chromium < Formula
  homepage "https://www.chromium.org/getting-involved/download-chromium"
  url "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Mac%2F318996%2Fchrome-mac.zip?generation=1425436024748000&alt=media"
  version "c318996"
  sha256 "6b7911a06a040efd20f83ff8124ee7676fc4b0ee17017a3517ecddf5b631d780"

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
