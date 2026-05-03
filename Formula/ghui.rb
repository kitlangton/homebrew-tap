class Ghui < Formula
  desc "Terminal UI for GitHub pull requests"
  homepage "https://github.com/kitlangton/ghui"
  version "0.4.5"
  license "MIT"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kitlangton/ghui/releases/download/v0.4.5/ghui-darwin-arm64.tar.gz"
      sha256 "d7fa63f9ac9d4ce885df08987b3c8b10977d05513123d34efa27f3700f246b20"
    else
      url "https://github.com/kitlangton/ghui/releases/download/v0.4.5/ghui-darwin-x64.tar.gz"
      sha256 "93b0fb41652e6857c087d6bf2c40c55976f9fc1e463bce879c66ccba95ee963a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kitlangton/ghui/releases/download/v0.4.5/ghui-linux-arm64.tar.gz"
      sha256 "f2e2b5828b941ca27b71f671a9786f5662cacb68cb836a16d8ed0143d4f4a5ef"
    else
      url "https://github.com/kitlangton/ghui/releases/download/v0.4.5/ghui-linux-x64.tar.gz"
      sha256 "12ce9c60302ee19faacbe293c35735be0c3f5029b88edb82b858207e97f17b7b"
    end
  end

  def install
    bin.install "ghui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ghui --version")
  end
end
