class Ghui < Formula
  desc "Terminal UI for GitHub pull requests"
  homepage "https://github.com/kitlangton/ghui"
  version "0.4.6"
  license "MIT"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kitlangton/ghui/releases/download/v0.4.6/ghui-darwin-arm64.tar.gz"
      sha256 "2cd9a2b5d5afcac9c19ffea1f5e66aa534eb97b19b74efdfbae213e2ace58199"
    else
      url "https://github.com/kitlangton/ghui/releases/download/v0.4.6/ghui-darwin-x64.tar.gz"
      sha256 "4425267fa08154bbecb71a2fda2a538312ed82857cd69b29fb1647e06291fd7a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kitlangton/ghui/releases/download/v0.4.6/ghui-linux-arm64.tar.gz"
      sha256 "fc68abe145458be7379c844d7398e088ec04f7f0f7ae95738042ac4c760a4520"
    else
      url "https://github.com/kitlangton/ghui/releases/download/v0.4.6/ghui-linux-x64.tar.gz"
      sha256 "0bfabc34b255503026cc1276883ce86d17823a21b5f909126adf5ae405f8feae"
    end
  end

  def install
    bin.install "ghui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ghui --version")
  end
end
