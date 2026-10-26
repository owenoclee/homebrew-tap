class JtRc < Formula
  desc "Jira as a remote VCS for agent workflows (release candidates)"
  homepage "https://github.com/owenoclee/jt"
  url on_arch_conditional(
    arm:   "https://github.com/owenoclee/jt/releases/download/v0.6.0-rc.4/jt-aarch64-apple-darwin.tar.gz",
    intel: "https://github.com/owenoclee/jt/releases/download/v0.6.0-rc.4/jt-x86_64-apple-darwin.tar.gz",
  )
  version "0.6.0-rc.4"
  sha256 on_arch_conditional(
    arm:   "807502687b049205643963623d816551e8237ff6880174794d9866a10992f2d7",
    intel: "bb67f4936b60396430760f3efc1bd2d77b7ddeba15e8c00783178d5cc9757a03",
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
