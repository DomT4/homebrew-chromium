class Chromium < Formula
  desc "Open-source web browser"
  homepage "https://www.chromium.org/getting-involved/download-chromium"

  if Hardware::CPU.arm?
    url "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Mac_Arm%2F905897%2Fchrome-mac.zip?generation=1627425346129546&alt=media",
        using: :nounzip
    sha256 "3973b66a839a88a29d743b12af697c96e0e0582be66fdd2b8ef2330074d93009"
    version "c905897"
  else
    url "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Mac%2F905898%2Fchrome-mac.zip?generation=1627425168967547&alt=media",
        using: :nounzip
    sha256 "9b0f8ba5c39526dd7a0ffe3b0da5e5d9f93fb6b7e2e4e999250200400030fba9"
    version "c905898"
  end

  option "with-exec-script", "Install a script for easy CLI opening of Chromium"

  def install
    system "unzip", Dir["*.zip"].first
    prefix.install "chrome-mac/Chromium.app"

    install_chrome = libexec/"install-chrome"
    install_chrome.write <<~EOS
      #!/usr/bin/env bash
      if [ ! -w "/Applications" ]; then
        echo "/Applications must be writable for this script to work"
        exit 1
      fi

      if [ ! -d "#{prefix}/Chromium.app" ]; then
        echo "Chromium has already been moved from #{opt_prefix}!"
        exit 1
      fi

      FILE="/Applications/Chromium.app"
      if [ -d "$FILE" ]; then
        echo "Removing old Chromium app"
        rm -rf "$FILE"
      fi

      mv #{prefix}/Chromium.app /Applications
      if [ -d "$FILE" ]; then
        echo "Chromium has been successfully moved to /Applications"
      else
        echo "Failed to move Chromium!"
      fi
    EOS
    install_chrome.chmod 0555

    if build.with? "exec-script"
      exec_script = bin/"chromium"
      exec_script.write <<~EOS
        #!/usr/bin/env bash
        exec open -a "Chromium" "$@"
      EOS
      exec_script.chmod 0555
    end
  end

  def caveats
    <<~EOS
      Linkapps has been deprecated by Homebrew.

      You can either move Chromium to Applications manually or
      with the provided installation script:
        #{opt_libexec}/install-chrome
      Or start using the sha256-verified Cask I've added to this tap:
        brew cask install mac-chromium

      Please note that if you go down that route you will need to
      periodically run:
        brew cask upgrade mac-chromium
    EOS
  end

  test do
    assert_predicate libexec/"install-chrome", :exist?
  end
end
