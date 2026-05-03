class Ghui < Formula
  desc "Terminal UI for GitHub pull requests"
  homepage "https://github.com/kitlangton/ghui"
  version "0.4.2"
  license "MIT"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kitlangton/ghui/releases/download/v0.4.2/ghui-darwin-arm64.tar.gz"
      sha256 "f797e96b765a15f214fb5a897df1a4d7145e984eba6d43e68cedd50d1d67c50b"
    else
      url "https://github.com/kitlangton/ghui/releases/download/v0.4.2/ghui-darwin-x64.tar.gz"
      sha256 "5b4b4ca6b89240a752b8afbc1ffa4a4ac3a7b8f81c0794fe8b184c20c3d03598"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kitlangton/ghui/releases/download/v0.4.2/ghui-linux-arm64.tar.gz"
      sha256 "ae6f1bd6bd1ffd2643b9aa89d76987ccb80abcbeb2c4dce763d4a48e101d3e4d"
    else
      url "https://github.com/kitlangton/ghui/releases/download/v0.4.2/ghui-linux-x64.tar.gz"
      sha256 "c1716846a4c6383420c4571fbf6ab3a4b4b58a48ea06af787d792e5679326401"
    end
  end

  def install
    bin.install "ghui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ghui --version")
  end
end
