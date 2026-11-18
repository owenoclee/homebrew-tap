class JtRc < Formula
  desc "Jira as a remote VCS for agent workflows (release candidates)"
  homepage "https://github.com/owenoclee/jt"
  url on_arch_conditional(
    arm:   "https://github.com/owenoclee/jt/releases/download/v0.7.0-rc.1/jt-aarch64-apple-darwin.tar.gz",
    intel: "https://github.com/owenoclee/jt/releases/download/v0.7.0-rc.1/jt-x86_64-apple-darwin.tar.gz",
  )
  version "0.7.0-rc.1"
  sha256 on_arch_conditional(
    arm:   "bf92df51895d244d05df6cf45a1b4ec1137871e4e00afb22a0127cbf0ca0cb5f",
    intel: "e8bda3d2bc3c9352d19d289197707a92992b8629cafad5f96a68431de96024e3",
  )
  license "MIT"

  depends_on :macos

  conflicts_with "owenoclee/tap/jt", because: "both install a `jt` binary"

  def install
    bin.install "jt"
  end

  def caveats
    <<~EOS
      To let your coding agent use jt, install its skill:
        jt skill install claude-code   # or: jt skill install codex
      After an upgrade, jt refreshes an installed skill by itself.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jt --version")
  end
end
