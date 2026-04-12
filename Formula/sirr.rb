class Sirr < Formula
  desc "CLI client for Sirr — push (dead drop), set (org secrets), get, and audit"
  homepage "https://github.com/sirrlock/sirr"
  version "2.0.57"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirr-darwin-arm64.tar.gz"
      sha256 "8376d06e3f06c4e18723c011d573f099c58fb713fa67e29c1f113731037c48b9"
    else
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirr-darwin-x64.tar.gz"
      sha256 "ef344248f09d3f0017a8d06e80a5109c3d44a9cda4af2c9f2d59e9df33a2dd59"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirr-linux-arm64.tar.gz"
      sha256 "06b40d684a0ef4d8a259493021d861d4f02b7b4133d66d0818309117bc75d0f4"
    else
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirr-linux-x64.tar.gz"
      sha256 "b1bcfb7bd4d76236bf75394549606635f7def99562fab395d462ea0dd4e0e2c8"
    end
  end

  def install
    bin.install "sirr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sirr --version")
  end
end
