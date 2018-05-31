class Chromium < Formula
  desc "Open-source web browser"
  homepage "https://www.chromium.org/getting-involved/download-chromium"
  url "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Mac%2F563272%2Fchrome-mac.zip?generation=1527787943218837&alt=media"
  version "c563272"
  sha256 "35cdbb5c771edce2e8961083753a111f5dabc5f5450f68bb669b27deb597be24"

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
