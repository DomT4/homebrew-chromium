class Chromium < Formula
  desc "Open-source web browser"
  homepage "https://www.chromium.org/getting-involved/download-chromium"
  url "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Mac%2F616240%2Fchrome-mac.zip?generation=1544695075326819&alt=media", :using => :nounzip
  version "c616240"
  sha256 "a8d22cd04f57334e4c74acefc2032668d8e433cda8c69630d63f577c8e50d090"

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
