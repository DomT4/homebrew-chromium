cask "mac-chromium" do
  version "c560293"
  sha256 "5e05e492ad78a073f1ed52b794eecf0945a50986e45ad68bf7474d03e3dc7533"

  url "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Mac%2F560293%2Fchrome-mac.zip?generation=1526926251263919&alt=media"
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
