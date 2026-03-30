class Sirrd < Formula
  desc "Sirr daemon — self-hosted ephemeral secret vault server"
  homepage "https://github.com/sirrlock/sirr"
  version "1.0.39"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirrd-darwin-arm64.tar.gz"
      sha256 "bd74575635b72425df1e340d449ca0943474f6da4c6bea381cb8825e0ebd8a6d"
    else
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirrd-darwin-x64.tar.gz"
      sha256 "c8e844444712eb31b93f627799360251b2ea1c1774bb9b9a4d61083ee44ec295"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirrd-linux-arm64.tar.gz"
      sha256 "b6894adbbff426991ab0f936d838a6b6fee861ecacbbd4ab0ee28979765bb3c0"
    else
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirrd-linux-x64.tar.gz"
      sha256 "9920012f828ef8012666d1dfb21a95ef825abf953117616202e6f80c417a4f40"
    end
  end

  def install
    bin.install "sirrd"
  end

  service do
    run [opt_bin/"sirrd", "serve"]
    keep_alive true
    log_path var/"log/sirrd.log"
    error_log_path var/"log/sirrd.log"
    environment_variables SIRR_DATA_DIR: var/"sirrd"
  end

  def post_install
    (var/"sirrd").mkpath
  end

  def caveats
    <<~EOS
      Thanks for installing sirrd!

      Set your master key and start the server:
        export SIRR_MASTER_KEY="$(openssl rand -hex 32)"
        sirrd serve

      Or run as a background service:
        brew services start sirrlock/tap/sirrd

      Quickstart and docs: https://sirr.dev/en/quickstart
    EOS
  end

  test do
    assert_match(/sirr/, shell_output("#{bin}/sirrd --version"))
  end
end
