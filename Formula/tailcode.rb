class Tailcode < Formula
  desc "Terminal wizard for publishing OpenCode to your Tailscale tailnet"
  homepage "https://github.com/kitlangton/tailcode"
  version "0.2.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kitlangton/tailcode/releases/download/v0.2.3/tailcode-darwin-arm64"
      sha256 "36973d9c81444ede1f4b7eee0ef5f07d065845f462ca05184d1ac93d6866f2e3"
    else
      url "https://github.com/kitlangton/tailcode/releases/download/v0.2.3/tailcode-darwin-x64"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/kitlangton/tailcode/releases/download/v0.2.3/tailcode-linux-x64"
      sha256 "d6b26806682d343415346c76e136275f090d834d4465ebbb405638adfa1e06f5"
    end
  end

  def install
    bin.install Dir["tailcode*"].first => "tailcode"
  end

  test do
    system "#{bin}/tailcode", "--help"
  end
end
