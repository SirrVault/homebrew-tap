class Sirr < Formula
  desc "CLI client for Sirr — push, get, and manage ephemeral secrets"
  homepage "https://github.com/sirrlock/sirr"
  version "1.0.33"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirr-darwin-arm64.tar.gz"
      sha256 "916f4693a3bece6834fbfa0d63f589b08bea68cb1ed62e470ab85daca13710ab"
    else
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirr-darwin-x64.tar.gz"
      sha256 "f0250168f08fac89ccbec086cfe75743e7934eb078c35f3c67c4f054864a75cf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirr-linux-arm64.tar.gz"
      sha256 "0f6a5f949bb158d79d2d3302da04c51a398970a2446c1c00b0704d84b965d55f"
    else
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirr-linux-x64.tar.gz"
      sha256 "4991c2f659e66cca2d69eebf5011a65bf9dd020801d92499c26a06ec576cb157"
    end
  end

  def install
    bin.install "sirr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sirr --version")
  end
end
