# Homebrew formula TEMPLATE for agentstack — not installable as-is.
#
# `packaging/homebrew/render-formula.py` fills the placeholders below from a
# release's own `checksums.txt`, and `release.yml` runs it so every release
# publishes a ready `agentstack.rb` as an asset. Publishing that file to the tap
# repository stays a human step (see RELEASING.md).
#
# There is deliberately no checked-in rendered formula. One used to live here
# with a real-looking version and real-looking hashes, five minor versions
# stale — a file that reads as publishable and installs the wrong binary is
# worse than no file.
class Agentstack < Formula
  desc "One portable manifest, every agent CLI — manage MCP servers + skills across AI coding tools"
  homepage "https://github.com/Tarekkharsa/agentstack"
  version "0.17.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/Tarekkharsa/agentstack/releases/download/v#{version}/agentstack-aarch64-apple-darwin.tar.gz"
      sha256 "3108777d6452c68ec4dd83d4640796288c1ec3b4e2c7438c01012fb2a23e1101"
    end
    on_intel do
      url "https://github.com/Tarekkharsa/agentstack/releases/download/v#{version}/agentstack-x86_64-apple-darwin.tar.gz"
      sha256 "fbf98a5d94c17f57a2fb79a1f613774b7de9fc3118aadaaea649b81d70e0f28b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Tarekkharsa/agentstack/releases/download/v#{version}/agentstack-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2d6c246856c65177e81b601a1142d3e66d0925083fc6bc0992789531d8e035f7"
    end
    on_intel do
      url "https://github.com/Tarekkharsa/agentstack/releases/download/v#{version}/agentstack-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e10ca10df0cac0611c0f61a2dd5e551768b02fe2d53045e918ab9a6fe316d7b8"
    end
  end

  def install
    # Homebrew strips an archive's single top-level directory while staging.
    bin.install "agentstack"
  end

  test do
    assert_match "agentstack", shell_output("#{bin}/agentstack --help")
  end
end
