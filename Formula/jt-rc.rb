class JtRc < Formula
  desc "Jira as a remote VCS for agent workflows (release candidates)"
  homepage "https://github.com/owenoclee/jt"
  url on_arch_conditional(
    arm:   "https://github.com/owenoclee/jt/releases/download/v0.6.0-rc.2/jt-aarch64-apple-darwin.tar.gz",
    intel: "https://github.com/owenoclee/jt/releases/download/v0.6.0-rc.2/jt-x86_64-apple-darwin.tar.gz",
  )
  version "0.6.0-rc.2"
  sha256 on_arch_conditional(
    arm:   "c55dc77c8adfbc627fdf703a793f094abf219fc9359141e5a85f96ef3fa1548f",
    intel: "8246b01fcb8fefe30c2571cabc5c81a58fdb055a54025bb947a6419a5b72f9c0",
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
