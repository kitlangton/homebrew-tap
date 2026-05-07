class Ghui < Formula
  desc "Terminal UI for GitHub pull requests"
  homepage "https://github.com/kitlangton/ghui"
  version "0.7.1"
  license "MIT"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kitlangton/ghui/releases/download/v0.7.1/ghui-darwin-arm64.tar.gz"
      sha256 "28ffc6687165301d9ae315742557f5d3764c7e72ac2bbbfc892f87ab1e39a5b7"
    else
      url "https://github.com/kitlangton/ghui/releases/download/v0.7.1/ghui-darwin-x64.tar.gz"
      sha256 "59ab98ef9fc477dd17fe713a3297292c234c0c1e952230f16074dbcf17687a1b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kitlangton/ghui/releases/download/v0.7.1/ghui-linux-arm64.tar.gz"
      sha256 "5b824b721c233afc85b96065f78d58dad0ab2a253e0cfb7d0cceba6af182a17c"
    else
      url "https://github.com/kitlangton/ghui/releases/download/v0.7.1/ghui-linux-x64.tar.gz"
      sha256 "4c4a87646ae02f323a416904841223a3bca8020fe8f7e6faaefa5742186fa58a"
    end
  end

  def install
    bin.install "ghui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ghui --version")
  end
end
