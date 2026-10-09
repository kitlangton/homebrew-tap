class Modafinil < Formula
  desc "Power-aware macOS keep-awake CLI"
  homepage "https://github.com/kitlangton/modafinil"
  license "MIT"

  depends_on macos: :ventura

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kitlangton/modafinil/releases/download/v0.1.1/modafinil-darwin-arm64.tar.gz"
      sha256 "98de431d5723a64ba20532f32faee383c9520ad9ca46549dd35b9f6e350b6e93"
    else
      url "https://github.com/kitlangton/modafinil/releases/download/v0.1.1/modafinil-darwin-x64.tar.gz"
      sha256 "0078862110407299b2cd645fa20f3adf2b61ebff34fd383371a8b5d8410fa6ba"
    end
  end

  def install
    bin.install "modafinil"
    doc.install "README.md"
  end

  def caveats
    <<~EOS
      Start now and at login:
        modafinil install

      Optional experimental AC-only closed-lid support (administrator approval):
        modafinil set --closed-lid on

      Stop and remove the installed services before uninstalling this package:
        modafinil uninstall
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/modafinil --version")
    assert_equal "awake=true closed_lid=false\n",
                 shell_output("#{bin}/modafinil check --power battery --mode always --closed-lid")
    assert_equal "awake=false closed_lid=false\n",
                 shell_output("#{bin}/modafinil check --power unknown --closed-lid")
  end
end
