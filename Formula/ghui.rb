class Ghui < Formula
  desc "Terminal UI for GitHub pull requests"
  homepage "https://github.com/kitlangton/ghui"
  version "0.6.0"
  license "MIT"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kitlangton/ghui/releases/download/v0.6.0/ghui-darwin-arm64.tar.gz"
      sha256 "eef6fff968d76833d650d8110ba176733def6b3e84722166b300a45b07259078"
    else
      url "https://github.com/kitlangton/ghui/releases/download/v0.6.0/ghui-darwin-x64.tar.gz"
      sha256 "2142f5125415eeacaa4438d2a416b12d4c4e873386c4102809f3185d6cf1dc8c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kitlangton/ghui/releases/download/v0.6.0/ghui-linux-arm64.tar.gz"
      sha256 "5edc5587ffaf3905de4745c663f62d21df021b5365657d18ebedce58881b54ef"
    else
      url "https://github.com/kitlangton/ghui/releases/download/v0.6.0/ghui-linux-x64.tar.gz"
      sha256 "b0851be63d16033bb69d6c0c0122abe71dcd8398b83f1019d170a7dc60a16279"
    end
  end

  def install
    bin.install "ghui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ghui --version")
  end
end
