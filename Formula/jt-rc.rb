class JtRc < Formula
  desc "Jira as a remote VCS for agent workflows (release candidates)"
  homepage "https://github.com/owenoclee/jt"
  url on_arch_conditional(
    arm:   "https://github.com/owenoclee/jt/releases/download/v0.6.0-rc.1/jt-aarch64-apple-darwin.tar.gz",
    intel: "https://github.com/owenoclee/jt/releases/download/v0.6.0-rc.1/jt-x86_64-apple-darwin.tar.gz",
  )
  version "0.6.0-rc.1"
  sha256 on_arch_conditional(
    arm:   "568d9c892b46d22148ae5b75fb884225f341e559bab31395050c83de9070b6ba",
    intel: "e79d54ffd1eb94f6ef542f012c6d12997350cc9638862f54f02a5fb2684ff05b",
  )
  license "MIT"

  depends_on :macos

  conflicts_with "owenoclee/tap/jt", because: "both install a `jt` binary"

  def install
    bin.install "jt"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jt --version")
  end
end
