cask "mac-chromium" do
  version "c530031"
  sha256 "9e760a07e73b45b97058fe1cd830698dc4bbf6742fe92ca0414904bd064b3c1a"

  url "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Mac%2F530031%2Fchrome-mac.zip?generation=1516245635782191&alt=media"
  name "Mac-Chromium"
  homepage "https://www.chromium.org/"
  conflicts_with cask: "chromium"

  app "chrome-mac/Chromium.app"
  binary "#{appdir}/Chromium.app/Contents/MacOS/Chromium", target: "chromium"

  zap delete: [
                "~/Library/Preferences/org.chromium.Chromium.plist",
                "~/Library/Caches/Chromium",
                "~/Library/Application Support/Chromium",
                "~/Library/Saved Application State/org.chromium.Chromium.savedState",
              ]
end
