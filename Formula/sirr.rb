class Sirr < Formula
  desc "CLI client for Sirr — push (dead drop), set (org secrets), get, and audit"
  homepage "https://github.com/sirrlock/sirr"
  version "2.0.59"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirr-darwin-arm64.tar.gz"
      sha256 "2afc4ba3efcf44890615cb7a2e1571b11829232a4a1bbe41e9573eef34feaeaa"
    else
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirr-darwin-x64.tar.gz"
      sha256 "946fabd3f42c3091286c24d0957497c198a8eed9f5e910b2d1a32ecc3bdcf3bf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirr-linux-arm64.tar.gz"
      sha256 "1cb772d976eb590687d41f4824fa058c7cbab03ab6469764215ff57732370477"
    else
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirr-linux-x64.tar.gz"
      sha256 "3d418f62b13736d99d207b70e7c921aed498fe9eb15703fedd493de766d1dc44"
    end
  end

  def install
    bin.install "sirr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sirr --version")
  end
end
