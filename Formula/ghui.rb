class Ghui < Formula
  desc "Terminal UI for GitHub pull requests"
  homepage "https://github.com/kitlangton/ghui"
  version "0.8.0"
  license "MIT"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kitlangton/ghui/releases/download/v0.8.0/ghui-darwin-arm64.tar.gz"
      sha256 "d9f70311860cd8af75f0f257233a0a366b18be0e67db9625c218685f98b84de0"
    else
      url "https://github.com/kitlangton/ghui/releases/download/v0.8.0/ghui-darwin-x64.tar.gz"
      sha256 "656e67d2d7d83d2154fe7b0cc01fa268f0d2eb367d7a6a7a716de7e332c1cac3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kitlangton/ghui/releases/download/v0.8.0/ghui-linux-arm64.tar.gz"
      sha256 "29d45e5f4778d7fe2691108cc8602a112d02e5480c06ec9bfb387078984cd7a3"
    else
      url "https://github.com/kitlangton/ghui/releases/download/v0.8.0/ghui-linux-x64.tar.gz"
      sha256 "107de479876504756c055ad4a593194b498d5be9d7287d902e28e88754e0a7fd"
    end
  end

  def install
    bin.install "ghui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ghui --version")
  end
end
