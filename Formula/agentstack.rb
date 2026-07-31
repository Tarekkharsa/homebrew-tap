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
  version "0.17.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/Tarekkharsa/agentstack/releases/download/v#{version}/agentstack-aarch64-apple-darwin.tar.gz"
      sha256 "0b11607e973489a4740c0ef27f9353f7dba1b14eefc379a995e4cc2ce3b12253"
    end
    on_intel do
      url "https://github.com/Tarekkharsa/agentstack/releases/download/v#{version}/agentstack-x86_64-apple-darwin.tar.gz"
      sha256 "b31fd637f8a6aebda4a226801b8f9f5519ab243a109921a7d7986bbd6b15276a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Tarekkharsa/agentstack/releases/download/v#{version}/agentstack-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c7f50d0a5a24a33e84e9e0431cf9af9abf47632a03eaf10a29ed67d7d685dc8f"
    end
    on_intel do
      url "https://github.com/Tarekkharsa/agentstack/releases/download/v#{version}/agentstack-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "79b913571a6d56255db588b656e47f9156ceb351c2769adf3add6f618a0fef53"
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
