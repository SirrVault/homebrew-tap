class Sirr < Formula
  desc "CLI client for Sirr — push (dead drop), set (org secrets), get, and audit"
  homepage "https://github.com/sirrlock/sirr"
  version "2.0.53"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirr-darwin-arm64.tar.gz"
      sha256 "ac2ccea9595205cec2ac6f319210be14de9a8fac7921182ee9256f146d0a9621"
    else
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirr-darwin-x64.tar.gz"
      sha256 "484cb99d1cb65b0fb44e1bfb5ba418d5fcbbcf16ba5f06efab2fb199be12197f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirr-linux-arm64.tar.gz"
      sha256 "9ce79dca96d8b47fc3284df73e683a22b25cf9697ed76af5febc160663a5fc1a"
    else
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirr-linux-x64.tar.gz"
      sha256 "900c92f58bb7b6c6a6e26c66ff4780dfbdcff32efca9e11c8c75ebf91887af5c"
    end
  end

  def install
    bin.install "sirr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sirr --version")
  end
end
