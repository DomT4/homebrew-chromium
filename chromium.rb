class Chromium < Formula
  desc "Open-source web browser"
  homepage "https://www.chromium.org/getting-involved/download-chromium"
  url "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Mac%2F502082%2Fchrome-mac.zip?generation=1505433253993892&alt=media"
  version "c502082"
  sha256 "9c17a2c9e9008b9eb9119cf5e2969583aecc2f046dc585e9101d91db7aae649e"

  option "with-exec-script", "Install a script for easy CLI opening of Chromium"

  def install
    libexec.install "Chromium.app"

    if build.with? "exec-script"
      exec_script = bin/"chromium"
      exec_script.write <<-EOS.undent
        #!/usr/bin/env bash
        exec open -a "Chromium" "$@"
      EOS
      exec_script.chmod 0555
    end
  end

  def caveats; <<-EOS.undent
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
end
