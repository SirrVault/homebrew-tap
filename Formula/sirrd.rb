class Sirrd < Formula
  desc "Sirr daemon — self-hosted ephemeral secret vault server"
  homepage "https://github.com/sirrlock/sirr"
  version "2.0.57"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirrd-darwin-arm64.tar.gz"
      sha256 "9e3ab0ad7b8e13717c0c5bc9b40c6e30ecc9f4c91c15a02b8d4d45a3f3f71e09"
    else
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirrd-darwin-x64.tar.gz"
      sha256 "7d52af5bac31517d5420ad42da767b0f8cb79dcb7ee246ee742c46d3322b277d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirrd-linux-arm64.tar.gz"
      sha256 "e278b59047b964c97cc992ef331b277517f3b325c99fad073a12f0d1ed2a8499"
    else
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirrd-linux-x64.tar.gz"
      sha256 "6508cb155763328a3fc78705c2a0a9681d4a5bb8dd2a3e276b8e0013f842d366"
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

      Note: The CLI defaults to https://sirrlock.com (zero-config cloud).
      Only install sirrd if you want a self-hosted instance.

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
