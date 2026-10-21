cask "scrawl" do
  version "0.3.12"
  sha256 "cc3564e833587409b1ee6a6594efc4d6435afb4c5c128249dd25dd79c422027a"

  url "https://scrawl.kitlangton.com/releases/Scrawl-#{version}-arm64.dmg"
  name "Scrawl"
  desc "Record your screen, voice and drawings into compact bundles for coding agents"
  homepage "https://scrawl.kitlangton.com/"

  livecheck do
    url "https://scrawl.kitlangton.com/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Scrawl.app"
  binary "#{appdir}/Scrawl.app/Contents/MacOS/scrawl"

  uninstall quit: "dev.kitlangton.scrawl"

  zap trash: [
    "~/.config/scrawl",
    "~/Library/Application Support/scrawl",
    "~/Library/Caches/dev.kitlangton.scrawl",
    "~/Library/HTTPStorages/dev.kitlangton.scrawl",
    "~/Library/Logs/Scrawl",
    "~/Library/Preferences/dev.kitlangton.scrawl.plist",
  ]
end
