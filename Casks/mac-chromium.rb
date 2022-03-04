cask "mac-chromium" do
  if Hardware::CPU.arm?
    version "c977407"
    url "https://commondatastorage.googleapis.com/chromium-browser-snapshots/Mac_Arm/#{version.delete("c")}/chrome-mac.zip",
         verified: "commondatastorage.googleapis.com/chromium-browser-snapshots/Mac_Arm/"
    sha256 "05302ffaabb3d497542754ad6984f9f5e00516caafc363759f2318e2cc9188cb"
  else
    version "c977406"
    url "https://commondatastorage.googleapis.com/chromium-browser-snapshots/Mac/#{version.delete("c")}/chrome-mac.zip",
         verified: "commondatastorage.googleapis.com/chromium-browser-snapshots/Mac/"
    sha256 "3c642e11f7df388a2ac26cb8b190a8eac6d4d308bbb02b1a0e7b7d8602ae31c3"
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
