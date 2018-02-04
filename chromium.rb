class Chromium < Formula
  desc "Open-source web browser"
  homepage "https://www.chromium.org/getting-involved/download-chromium"
  url "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Mac%2F534286%2Fchrome-mac.zip?generation=1517701052713374&alt=media"
  version "c534286"
  sha256 "296fd953641908410f3d7626a8227dcf201502233eb19a555316a90013b3508b"

  option "with-exec-script", "Install a script for easy CLI opening of Chromium"

  def install
    libexec.install "Chromium.app"

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
      cp -rf #{opt_libexec}/Chromium.app /Applications
    Or start using the sha256-verified Cask I've added to this tap:
      brew cask install mac-chromium

    Please note that Homebrew currently has no automatic upgrade functionality
    for casks, so if you go down that route you will need to periodically run:
      brew cask reinstall mac-chromium
  EOS
  end

  test do
    assert_predicate libexec/"Chromium.app/Contents/MacOS/Chromium", :exist?
  end
end
