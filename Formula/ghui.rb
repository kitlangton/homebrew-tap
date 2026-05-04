class Ghui < Formula
  desc "Terminal UI for GitHub pull requests"
  homepage "https://github.com/kitlangton/ghui"
  version "0.5.0"
  license "MIT"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kitlangton/ghui/releases/download/v0.5.0/ghui-darwin-arm64.tar.gz"
      sha256 "55e49d84488a9b0955a478cb88d79414c68cdf34726000286d7483a66172ba10"
    else
      url "https://github.com/kitlangton/ghui/releases/download/v0.5.0/ghui-darwin-x64.tar.gz"
      sha256 "cfbae4049959a1aaa271301b56862992822d4077b5ec4b491cd93fb918ecb8b6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kitlangton/ghui/releases/download/v0.5.0/ghui-linux-arm64.tar.gz"
      sha256 "21e7164f7182164f7c23dda2370d0727d0929ffecfb18c796f5b3ef72d04671a"
    else
      url "https://github.com/kitlangton/ghui/releases/download/v0.5.0/ghui-linux-x64.tar.gz"
      sha256 "2fc08b71d91d9e7ae58d1966e6885f4a2a403a72f9319eb5d48a31152257059f"
    end
  end

  def install
    bin.install "ghui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ghui --version")
  end
end
