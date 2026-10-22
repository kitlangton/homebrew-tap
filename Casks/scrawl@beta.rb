cask "scrawl@beta" do
  version "0.3.13"
  sha256 "0e1bd4a183baff30c5da8aa543b7ecde808afb4e0504bdeaab8a86c3fd57b466"

  url "https://scrawl.kitlangton.com/releases/Scrawl-#{version}-arm64.dmg"
  name "Scrawl Beta"
  desc "Early builds of Scrawl's screen, voice and drawing capture tool"
  homepage "https://scrawl.kitlangton.com/"

  livecheck do
    url "https://scrawl.kitlangton.com/appcast.xml"
    strategy :sparkle do |items|
      items.select { |item| item.channel == "beta" }.map(&:short_version)
    end
  end

  auto_updates true
  conflicts_with cask: "scrawl"
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

  caveats <<~EOS
    Enable Get beta updates in Scrawl's Settings > General to receive new betas.
    Turning it off keeps this build until a newer stable release is available.
  EOS
end
