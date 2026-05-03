class Ghui < Formula
  desc "Terminal UI for GitHub pull requests"
  homepage "https://github.com/kitlangton/ghui"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kitlangton/ghui/releases/download/v0.4.1/ghui-darwin-arm64.tar.gz"
      sha256 "515bd5245210563093b69c5e7e07eba94634812d34e73fa27a0e890ae741f3b6"
    else
      url "https://github.com/kitlangton/ghui/releases/download/v0.4.1/ghui-darwin-x64.tar.gz"
      sha256 "2ba23d983c760677cfc277e3b126e1095ee9882eb4c10bf89130fb5cbf64f7b3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kitlangton/ghui/releases/download/v0.4.1/ghui-linux-arm64.tar.gz"
      sha256 "c72af300fdb75c6d8910ea3c01824d44558f1d6a4cb0b7f8bcc031f759c71d60"
    else
      url "https://github.com/kitlangton/ghui/releases/download/v0.4.1/ghui-linux-x64.tar.gz"
      sha256 "ba6743d67aa5bb62aae67cd3fb58fb55fea6b2aaae2765143c1e1b2b4f7bd82d"
    end
  end

  depends_on "gh"

  def install
    bin.install "ghui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ghui --version")
  end
end
