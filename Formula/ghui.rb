class Ghui < Formula
  desc "Terminal UI for GitHub pull requests"
  homepage "https://github.com/kitlangton/ghui"
  version "0.9.0"
  license "MIT"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kitlangton/ghui/releases/download/v0.9.0/ghui-darwin-arm64.tar.gz"
      sha256 "0f0597395696f74c66baf6ffd78f7187dcdcebd2272a7ab69c744f2421ca40c8"
    else
      url "https://github.com/kitlangton/ghui/releases/download/v0.9.0/ghui-darwin-x64.tar.gz"
      sha256 "01ea9c772a8925c2a7c9c5676e2e6fa4f37b580e5e64c0e507101da58be46531"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kitlangton/ghui/releases/download/v0.9.0/ghui-linux-arm64.tar.gz"
      sha256 "993750a4398726f1693ea1c9a8a29d560529037aa6dac43c5e775a83bac67ca5"
    else
      url "https://github.com/kitlangton/ghui/releases/download/v0.9.0/ghui-linux-x64.tar.gz"
      sha256 "6ca05990fbdfeb5feafbb0ba46da00590bb2c22366a391bab0b7ca07e39d1550"
    end
  end

  def install
    bin.install "ghui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ghui --version")
  end
end
