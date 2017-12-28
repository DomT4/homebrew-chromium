cask "mac-chromium" do
  version "c526269"
  sha256 "07f02cdd6e33d8fa410ee3a2ba9a407acdd94820c1f83a13e075894792f97c75"

  url "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Mac%2F526269%2Fchrome-mac.zip?generation=1514434752803526&alt=media"
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
