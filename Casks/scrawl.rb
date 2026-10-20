cask "scrawl" do
  version "0.3.10"
  sha256 "b6da6d158d51d7557651cff7d3659c276f88f99ffb83700a9a00c2b70e3607cc"

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
