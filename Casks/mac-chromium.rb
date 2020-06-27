cask "mac-chromium" do
  version "c783312"
  sha256 "762b39bdd60fed918e340a14a15ed24bca72b48a03799b2bea55201ac1b8fcb0"

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
