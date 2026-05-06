class Ghui < Formula
  desc "Terminal UI for GitHub pull requests"
  homepage "https://github.com/kitlangton/ghui"
  version "0.7.0"
  license "MIT"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kitlangton/ghui/releases/download/v0.7.0/ghui-darwin-arm64.tar.gz"
      sha256 "f376ca02f5f63edc46636edd1814f4fd1f75dc930425427b7240c5e00627c05a"
    else
      url "https://github.com/kitlangton/ghui/releases/download/v0.7.0/ghui-darwin-x64.tar.gz"
      sha256 "30e69c288281a8967cc7d20330e6e4c811b49e3148a6886103fb17d2fd6e8749"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kitlangton/ghui/releases/download/v0.7.0/ghui-linux-arm64.tar.gz"
      sha256 "e9d693e953ee21d2e4db304daaf91c8e0689b8aa654e80a7691401cc92e5f9f3"
    else
      url "https://github.com/kitlangton/ghui/releases/download/v0.7.0/ghui-linux-x64.tar.gz"
      sha256 "c4a4129b55f36b567f86da16af64cb39410d6ef5c2b45372432fa0000cceb64e"
    end
  end

  def install
    bin.install "ghui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ghui --version")
  end
end
