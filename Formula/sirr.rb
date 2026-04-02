class Sirr < Formula
  desc "CLI client for Sirr — push (dead drop), set (org secrets), get, and audit"
  homepage "https://github.com/sirrlock/sirr"
  version "1.0.51"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirr-darwin-arm64.tar.gz"
      sha256 "ea37e25332ec020a2b3a04b1f79364b4eee7ee28114e2d29828bbe423983bd66"
    else
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirr-darwin-x64.tar.gz"
      sha256 "fa81bfccf4a1c8d48519831637752ceffa2efbf0d8a2d8f1e7c0837c9e4a1cf3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirr-linux-arm64.tar.gz"
      sha256 "27db7bdbd7f34ea3ae1838f851d94646bc32972584f109ecf96cfa9fcbc62e26"
    else
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirr-linux-x64.tar.gz"
      sha256 "d24e7db7cbb833e324d25070b14d9f0d826f1859c10f4a82a10d2e3500e345fd"
    end
  end

  def install
    bin.install "sirr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sirr --version")
  end
end
