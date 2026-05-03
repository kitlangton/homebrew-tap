class Ghui < Formula
  desc "Terminal UI for GitHub pull requests"
  homepage "https://github.com/kitlangton/ghui"
  version "0.4.4"
  license "MIT"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kitlangton/ghui/releases/download/v0.4.4/ghui-darwin-arm64.tar.gz"
      sha256 "b02e08dd08d278871f075d261599348d51fcc7f46dee1878bddb6d3ca7128abe"
    else
      url "https://github.com/kitlangton/ghui/releases/download/v0.4.4/ghui-darwin-x64.tar.gz"
      sha256 "8f549bbb23078a63847a808af47214ae7a94fc80488ccb5e436433c007cbe7f3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kitlangton/ghui/releases/download/v0.4.4/ghui-linux-arm64.tar.gz"
      sha256 "6bbd50b4641199ac6cbb5018998d55f51e42a85bb789d2e342efb779f199e5bf"
    else
      url "https://github.com/kitlangton/ghui/releases/download/v0.4.4/ghui-linux-x64.tar.gz"
      sha256 "33ca78e8d67c36d2624df4a2d2a818fb0ee15e864e0dd7176c962e5b5a9b079b"
    end
  end

  def install
    bin.install "ghui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ghui --version")
  end
end
