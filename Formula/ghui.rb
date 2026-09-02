class Ghui < Formula
  desc "Terminal UI for GitHub pull requests"
  homepage "https://github.com/kitlangton/ghui"
  version "0.9.1"
  license "MIT"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kitlangton/ghui/releases/download/v0.9.1/ghui-darwin-arm64.tar.gz"
      sha256 "8d2d4424b4238069ceec45c610df9f09f40bbf01e40c309257aaae56795424d3"
    else
      url "https://github.com/kitlangton/ghui/releases/download/v0.9.1/ghui-darwin-x64.tar.gz"
      sha256 "321f6137d42fada3a8c7aae4a3997cc53c1ff0507383f46679ed80824b24540a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kitlangton/ghui/releases/download/v0.9.1/ghui-linux-arm64.tar.gz"
      sha256 "9a90264d830d1dc3388086f0e55a294364beb53c48f33e6e2e7c58a52f044c0d"
    else
      url "https://github.com/kitlangton/ghui/releases/download/v0.9.1/ghui-linux-x64.tar.gz"
      sha256 "dd46f080000a3ab9a03a3fc8b14ac0449728b002875365530de5f47375f37921"
    end
  end

  def install
    bin.install "ghui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ghui --version")
  end
end
