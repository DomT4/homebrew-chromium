class Chromium < Formula
  desc "Open-source web browser"
  homepage "https://www.chromium.org/getting-involved/download-chromium"
  url "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Mac%2F458499%2Fchrome-mac.zip?generation=1490124779348239&alt=media"
  version "c458499"
  sha256 "dfcb74ea686bd4c620dd58e45b5b5b925f9e2d6f90d54935fc51ebd6d3d31854"

  option "with-exec-script", "Install a script for easy CLI opening of Chromium"

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

  def caveats; <<-EOS.undent
    Homebrew has chosen to deprecate the linkapps function, which is a step
    towards killing the usefulness and support of installing .apps through
    Homebrew formulae completely. I strongly disagree with removing app
    functionality through Homebrew formulae but the decision is out of my
    hands, sorry.

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
