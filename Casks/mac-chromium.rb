cask "mac-chromium" do
  if Hardware::CPU.arm?
    version "c1087222"
    url "https://commondatastorage.googleapis.com/chromium-browser-snapshots/Mac_Arm/#{version.delete("c")}/chrome-mac.zip",
         verified: "commondatastorage.googleapis.com/chromium-browser-snapshots/Mac_Arm/"
    sha256 "04db815e03e3e3e33911c41cb7da0dd60f39ae880f50362ceb93a8b504e8bff0"
  else
    version "c1087188"
    url "https://commondatastorage.googleapis.com/chromium-browser-snapshots/Mac/#{version.delete("c")}/chrome-mac.zip",
         verified: "commondatastorage.googleapis.com/chromium-browser-snapshots/Mac/"
    sha256 "05edf32d1b1b858426df55d4da1551465fd2e7381da9436f6b5f1a4818c4b4c7"
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
