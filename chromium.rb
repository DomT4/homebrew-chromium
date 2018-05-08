class Chromium < Formula
  desc "Open-source web browser"
  homepage "https://www.chromium.org/getting-involved/download-chromium"
  url "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Mac%2F556993%2Fchrome-mac.zip?generation=1525822393494170&alt=media"
  version "c556993"
  sha256 "6e9bd536551fa22c124a566933a098ae3d16d103523fbf5a28d7aa3b70d078dc"

  option "with-exec-script", "Install a script for easy CLI opening of Chromium"

  def install
    prefix.install "Chromium.app"

    if build.with? "exec-script"
      exec_script = bin/"chromium"
      exec_script.write <<~EOS
        #!/usr/bin/env bash
        exec open -a "Chromium" "$@"
      EOS
      exec_script.chmod 0555
    end
  end

  def caveats; <<~EOS
    Linkapps has been deprecated by Homebrew.

    You can either copy Chromium to Applications:
      cp -rf #{opt_prefix}/Chromium.app /Applications
    Or start using the sha256-verified Cask I've added to this tap:
      brew cask install mac-chromium

    Please note that if you go down that route you will need to periodically
    run:
      brew cask upgrade mac-chromium
  EOS
  end

  test do
    assert_predicate prefix/"Chromium.app/Contents/MacOS/Chromium", :exist?
  end
end
