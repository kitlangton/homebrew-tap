cask "scrawl" do
  version "0.3.13"
  sha256 "0e1bd4a183baff30c5da8aa543b7ecde808afb4e0504bdeaab8a86c3fd57b466"

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
  depends_on macos: :sequoia

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
