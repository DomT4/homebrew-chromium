cask "mac-chromium" do
  version "c574425"
  sha256 "acfdb3f1e2c81539434fbf4c8949dcd3b11d2c1767776389eb8849162aace728"

  url "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Mac%2F574425%2Fchrome-mac.zip?generation=1531357568481672&alt=media"
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
