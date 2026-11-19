class JtRc < Formula
  desc "Jira as a remote VCS for agent workflows (release candidates)"
  homepage "https://github.com/owenoclee/jt"
  url on_arch_conditional(
    arm:   "https://github.com/owenoclee/jt/releases/download/v0.7.0-rc.2/jt-aarch64-apple-darwin.tar.gz",
    intel: "https://github.com/owenoclee/jt/releases/download/v0.7.0-rc.2/jt-x86_64-apple-darwin.tar.gz",
  )
  version "0.7.0-rc.2"
  sha256 on_arch_conditional(
    arm:   "355a717d52597f045cfd185bd9bae3c5145030679f1a251b71c38c159ab1fd12",
    intel: "f8b927e761f48f17b17fb8839a15f7c70f9c4600d3ef77c12dfd57c7e91ac35a",
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
