class Sirr < Formula
  desc "CLI client for Sirr — push, get, and manage ephemeral secrets"
  homepage "https://github.com/sirrlock/sirr"
  version "1.0.39"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirr-darwin-arm64.tar.gz"
      sha256 "b0a15c36c5c6618614e4a5663b1e1ada4b273512a0c93ef0f7a6e00a49527493"
    else
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirr-darwin-x64.tar.gz"
      sha256 "89ae1ddf0c857b5e13f1e57b4bb47d3494040f3587695c0e339d4a330514c2de"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirr-linux-arm64.tar.gz"
      sha256 "e3d1afbe5a87f178b333571a33d7484460e9d665fc1f4e4f366203bef171ce7b"
    else
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirr-linux-x64.tar.gz"
      sha256 "838e2ca280479aba2080f8cba0e7d326d04104ec89be01a1350a80245f2e9ba9"
    end
  end

  def install
    bin.install "sirr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sirr --version")
  end
end
