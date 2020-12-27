cask "mac-chromium" do
  version "c839402"
  sha256 "82bcd67cd796d44b17e28a583837161f236d951738b254e12218c07b6b2f940c"

  url "https://commondatastorage.googleapis.com/chromium-browser-snapshots/Mac/#{version.gsub("c", "")}/chrome-mac.zip"
  name "Mac-Chromium"
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

  caveats <<~EOS
    As of https://github.com/Homebrew/homebrew-cask/commit/7af98a34ae
    Homebrew Cask has moved to a checksummed and versioned Chromium cask.

    If you wish to migrate you can:
      brew cask uninstall mac-chromium && brew cask install chromium

    This tap will remain supported for the foreseeable.
  EOS

  zap delete: [
                "~/Library/Preferences/org.chromium.Chromium.plist",
                "~/Library/Caches/Chromium",
                "~/Library/Application Support/Chromium",
                "~/Library/Saved Application State/org.chromium.Chromium.savedState",
              ]
end
