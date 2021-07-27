cask "mac-chromium" do
  if Hardware::CPU.arm?
    version "c905897"
    url "https://commondatastorage.googleapis.com/chromium-browser-snapshots/Mac_Arm/#{version.delete("c")}/chrome-mac.zip",
         verified: "commondatastorage.googleapis.com/chromium-browser-snapshots/Mac_Arm/"
    sha256 "3973b66a839a88a29d743b12af697c96e0e0582be66fdd2b8ef2330074d93009"
  else
    version "c905898"
    url "https://commondatastorage.googleapis.com/chromium-browser-snapshots/Mac/#{version.delete("c")}/chrome-mac.zip",
         verified: "commondatastorage.googleapis.com/chromium-browser-snapshots/Mac/"
    sha256 "9b0f8ba5c39526dd7a0ffe3b0da5e5d9f93fb6b7e2e4e999250200400030fba9"
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
