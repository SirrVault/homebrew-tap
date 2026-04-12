class Sirrd < Formula
  desc "Sirr daemon — self-hosted ephemeral secret vault server"
  homepage "https://github.com/sirrlock/sirr"
  version "2.0.53"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirrd-darwin-arm64.tar.gz"
      sha256 "7d0a82b8a2b5b6fd352ed644e9f55e3fbc3f7bdbb7b20b9d52d7a14820070151"
    else
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirrd-darwin-x64.tar.gz"
      sha256 "7c60bc14538b8e005bdf0c1397e6d854a11ed0009dd0bf1045ea09a0fda54396"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirrd-linux-arm64.tar.gz"
      sha256 "7fa2f766aa617355b5ad80a1ab1c8eae62b73decb3de5a249c03396649e1801e"
    else
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirrd-linux-x64.tar.gz"
      sha256 "884709112f9c1c95cde258f8a18822aa6cca7b491300fb1e51211dd0d3b99855"
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
