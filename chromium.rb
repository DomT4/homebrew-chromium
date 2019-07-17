class Chromium < Formula
  desc "Open-source web browser"
  homepage "https://www.chromium.org/getting-involved/download-chromium"
  url "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Mac%2F678304%2Fchrome-mac.zip?generation=1563381811821799&alt=media", :using => :nounzip
  version "c678304"
  sha256 "c8f865382a8e13900d991f7849583e3b31c30a717f8bce0840ab7fe140f21c00"

  option "with-exec-script", "Install a script for easy CLI opening of Chromium"

  def install
    system "unzip", Dir["*.zip"].first
    prefix.install "chrome-mac/Chromium.app"

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
