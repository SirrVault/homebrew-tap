class Sirr < Formula
  desc "CLI client for Sirr — push (dead drop), set (org secrets), get, and audit"
  homepage "https://github.com/sirrlock/sirr"
  version "2.0.56"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirr-darwin-arm64.tar.gz"
      sha256 "5433f306a18527648d72d18f7de40a66877e4101351f1c3e60b9ab02b78dfa74"
    else
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirr-darwin-x64.tar.gz"
      sha256 "17f45330634ccc3e94f1cd83526305d19d05d849c7efa3723fc53ccae42f7f11"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirr-linux-arm64.tar.gz"
      sha256 "996607ac7ad7032e76a8b2aa7f59db8c35a2d230854c55c9f0d936c441f1ab43"
    else
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirr-linux-x64.tar.gz"
      sha256 "6b3773e64587e372f583b9403b9ef11e4eb21be6a09c0c11420722108d418035"
    end
  end

  def install
    bin.install "sirr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sirr --version")
  end
end
