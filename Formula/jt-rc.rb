class JtRc < Formula
  desc "Jira as a remote VCS for agent workflows (release candidates)"
  homepage "https://github.com/owenoclee/jt"
  url on_arch_conditional(
    arm:   "https://github.com/owenoclee/jt/releases/download/v0.6.0-rc.3/jt-aarch64-apple-darwin.tar.gz",
    intel: "https://github.com/owenoclee/jt/releases/download/v0.6.0-rc.3/jt-x86_64-apple-darwin.tar.gz",
  )
  version "0.6.0-rc.3"
  sha256 on_arch_conditional(
    arm:   "3d2560457011bf72c3135f3d94a34461d146f755ebb4ba978c76fb15449132ff",
    intel: "1ed77f110fad8dac4ca8050c1b48af3ce05a2f4092dbe2c2018c09f1e1d1a59a",
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
