class Tailcode < Formula
  desc "Terminal wizard for publishing OpenCode to your Tailscale tailnet"
  homepage "https://github.com/kitlangton/tailcode"
  version "0.2.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kitlangton/tailcode/releases/download/v0.2.7/tailcode-darwin-arm64"
      sha256 "3dd167c8c0143b4ddba81ccc44d21a259709df0632c84581833846a71689ba98"
    else
      url "https://github.com/kitlangton/tailcode/releases/download/v0.2.7/tailcode-darwin-x64"
      sha256 "eddc9efbf28cbe3d2149dcee66825dfaba05bc74b98b4a9859effd6554eddfe0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/kitlangton/tailcode/releases/download/v0.2.7/tailcode-linux-x64"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    end
  end

  def install
    bin.install Dir["tailcode*"].first => "tailcode"
  end

  test do
    system "#{bin}/tailcode", "--help"
  end
end
