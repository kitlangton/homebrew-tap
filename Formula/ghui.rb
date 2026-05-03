class Ghui < Formula
  desc "Terminal UI for GitHub pull requests"
  homepage "https://github.com/kitlangton/ghui"
  version "0.4.3"
  license "MIT"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kitlangton/ghui/releases/download/v0.4.3/ghui-darwin-arm64.tar.gz"
      sha256 "92f9fc615997cb865937c19aae0c8f87d58430d3a2e5d3680a0a9658f2d3ffe2"
    else
      url "https://github.com/kitlangton/ghui/releases/download/v0.4.3/ghui-darwin-x64.tar.gz"
      sha256 "8874ee2cf2acfb8df97ad4b1a4bb0d9b9220a4711a9e36b927388230fe0c9a6d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kitlangton/ghui/releases/download/v0.4.3/ghui-linux-arm64.tar.gz"
      sha256 "b60f75d24bedc44eb38999f13db5097b02089c74a99059420ef7bef24fda73ba"
    else
      url "https://github.com/kitlangton/ghui/releases/download/v0.4.3/ghui-linux-x64.tar.gz"
      sha256 "a071f715ca479e37cfa03951a3adc1ad6bd578f9375b1a9d06fa8f00a173f7e6"
    end
  end

  def install
    bin.install "ghui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ghui --version")
  end
end
