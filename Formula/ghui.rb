class Ghui < Formula
  desc "Terminal UI for GitHub pull requests"
  homepage "https://github.com/kitlangton/ghui"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kitlangton/ghui/releases/download/v0.4.0/ghui-darwin-arm64.tar.gz"
      sha256 "2f03075720f61dd174237b2041ff865423ab8e8252f8c2e87e26e780c944c744"
    else
      url "https://github.com/kitlangton/ghui/releases/download/v0.4.0/ghui-darwin-x64.tar.gz"
      sha256 "fb759b555447452c27d21210aea58800e4b07bcb800c304c15b8b78d19973c6c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kitlangton/ghui/releases/download/v0.4.0/ghui-linux-arm64.tar.gz"
      sha256 "74b5a0c353597b3f2159a9ee0cf63da4e84faabf8e8bf3a88dbbe5beb4f28622"
    else
      url "https://github.com/kitlangton/ghui/releases/download/v0.4.0/ghui-linux-x64.tar.gz"
      sha256 "547b5064041d12b1c4344ad9456f94ac98b71f88878ac971241e0c0f4788d166"
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
