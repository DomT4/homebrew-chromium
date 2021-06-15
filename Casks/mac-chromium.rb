cask "mac-chromium" do
  if Hardware::CPU.arm?
    version "c892360"
    url "https://commondatastorage.googleapis.com/chromium-browser-snapshots/Mac_Arm/#{version.delete("c")}/chrome-mac.zip",
         verified: "commondatastorage.googleapis.com/chromium-browser-snapshots/Mac_Arm/"
    sha256 "881b003f86372ac01c301a2d7a5e49b417d46c2a2271a472692b33ad167f017d"
  else
    version "c892345"
    url "https://commondatastorage.googleapis.com/chromium-browser-snapshots/Mac/#{version.delete("c")}/chrome-mac.zip",
         verified: "commondatastorage.googleapis.com/chromium-browser-snapshots/Mac/"
    sha256 "d57bb848617184724d33937123b3cbb3a6babf282e4ed884ceadace581a3f0f0"
  end

  name "Mac-Chromium"
  desc "Free and open-source web browser"
  homepage "https://www.chromium.org/"

  conflicts_with cask: "chromium"

  app "chrome-mac/Chromium.app"
  shimscript = "#{staged_path}/chromium.wrapper.sh"
  binary shimscript, target: "chromium"

  preflight do
    IO.write shimscript, <<~EOS
      #!/bin/sh
      '#{appdir}/Chromium.app/Contents/MacOS/Chromium' "$@"
    EOS
  end

  zap trash: [
    "~/Library/Application Support/Chromium",
    "~/Library/Caches/Chromium",
    "~/Library/Preferences/org.chromium.Chromium.plist",
    "~/Library/Saved Application State/org.chromium.Chromium.savedState",
  ]

  caveats <<~EOS
    As of https://github.com/Homebrew/homebrew-cask/commit/7af98a34ae
    Homebrew Cask has moved to a checksummed and versioned Chromium cask.

    If you wish to migrate you can:
      brew cask uninstall mac-chromium && brew cask install chromium

    This tap will remain supported for the foreseeable.
  EOS
end
