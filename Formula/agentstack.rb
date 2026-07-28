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
  version "0.16.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/Tarekkharsa/agentstack/releases/download/v#{version}/agentstack-aarch64-apple-darwin.tar.gz"
      sha256 "c0e68f6d29399ba3b4fc9f0180a528d1380a41d4ada58cedc9ade9ed00c9bad4"
    end
    on_intel do
      url "https://github.com/Tarekkharsa/agentstack/releases/download/v#{version}/agentstack-x86_64-apple-darwin.tar.gz"
      sha256 "643c4d77c81234e8ff10bd45e392c8d134fa2f1d2808d005e00ee15e8e0ff0ef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Tarekkharsa/agentstack/releases/download/v#{version}/agentstack-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "45404d0347b472dd9a4f4a8750119c9d059f5d6196609bf736da52d6d29a87dc"
    end
    on_intel do
      url "https://github.com/Tarekkharsa/agentstack/releases/download/v#{version}/agentstack-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c2d89b559a8e9200aed9586aca830b9071ef56f7fd8fc737409607b7e17054ac"
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
