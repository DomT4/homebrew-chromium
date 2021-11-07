cask "mac-chromium" do
  if Hardware::CPU.arm?
    version "c939171"
    url "https://commondatastorage.googleapis.com/chromium-browser-snapshots/Mac_Arm/#{version.delete("c")}/chrome-mac.zip",
         verified: "commondatastorage.googleapis.com/chromium-browser-snapshots/Mac_Arm/"
    sha256 "c09a83e631ec60f3da1b2b5ba94bc77ebf8c8c4536496dc51dbca4cd143bbbb1"
  else
    version "c939171"
    url "https://commondatastorage.googleapis.com/chromium-browser-snapshots/Mac/#{version.delete("c")}/chrome-mac.zip",
         verified: "commondatastorage.googleapis.com/chromium-browser-snapshots/Mac/"
    sha256 "64927df01858717737a924e78815ef772bd0a2ab07a6c26fd4e46f8d0c1701a9"
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
