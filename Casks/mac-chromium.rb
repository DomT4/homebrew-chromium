cask "mac-chromium" do
  version "c505979"
  sha256 "79e8569d46746928e923f19fbd3a36291d9805ba6efbcc778deba2415fc9d7e0"

  url "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Mac%2F505979%2Fchrome-mac.zip?generation=1507019690408104&alt=media"
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
