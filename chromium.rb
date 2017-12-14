class Chromium < Formula
  desc "Open-source web browser"
  homepage "https://www.chromium.org/getting-involved/download-chromium"
  url "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Mac%2F524004%2Fchrome-mac.zip?generation=1513227778537627&alt=media"
  version "c524004"
  sha256 "7d3f1b5f7cab0a9d257f0bb3c9c25781222e94b73afc99ca8c2943e78ffce300"

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
    Homebrew has chosen to deprecate the linkapps function, which is a step
    towards killing the usefulness and support of installing .apps through
    Homebrew formulae completely. That decision is out of my hands, sorry.

    You can work around this once linkapps stops functioning by doing:
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
