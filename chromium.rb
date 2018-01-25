class Chromium < Formula
  desc "Open-source web browser"
  homepage "https://www.chromium.org/getting-involved/download-chromium"
  url "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Mac%2F531796%2Fchrome-mac.zip?generation=1516849734410675&alt=media"
  version "c531796"
  sha256 "8a973ce53bd8fecd6b325fc794b07c292f85eda125756a815ac06141743ef0f1"

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
