class Ghui < Formula
  desc "Terminal UI for GitHub pull requests"
  homepage "https://github.com/kitlangton/ghui"
  version "0.4.7"
  license "MIT"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kitlangton/ghui/releases/download/v0.4.7/ghui-darwin-arm64.tar.gz"
      sha256 "b65f56c6409ded853f897604f27ba189ce4a30b50947009762deee1fd662c492"
    else
      url "https://github.com/kitlangton/ghui/releases/download/v0.4.7/ghui-darwin-x64.tar.gz"
      sha256 "d1ffa90328e6dab363ed875600715e99437329624390c0d9f1d02a8fb74df56f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kitlangton/ghui/releases/download/v0.4.7/ghui-linux-arm64.tar.gz"
      sha256 "243e56217184e6f82dca9d9310e3abe17f66fb136caaa1ca61131d67839c5077"
    else
      url "https://github.com/kitlangton/ghui/releases/download/v0.4.7/ghui-linux-x64.tar.gz"
      sha256 "4c3cb665b49ec13f0d322e3967236605467c917df0a737fa7f516f019177cb4b"
    end
  end

  def install
    bin.install "ghui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ghui --version")
  end
end
