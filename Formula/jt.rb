class Jt < Formula
  desc "Jira as a remote VCS for agent workflows"
  homepage "https://github.com/owenoclee/jt"
  url on_arch_conditional(
    arm:   "https://github.com/owenoclee/jt/releases/download/v0.2.0/jt-aarch64-apple-darwin.tar.gz",
    intel: "https://github.com/owenoclee/jt/releases/download/v0.2.0/jt-x86_64-apple-darwin.tar.gz",
  )
  sha256 on_arch_conditional(
    arm:   "9679a44c614ed2e8791d69c02f1ae127ef8c3929a24283f0b9257a50236985ce",
    intel: "a4c0576df9af70338e7263181caffb378c6b3d3bd53cfe11e9a3513aaa7bc729",
  )
  license "MIT"

  depends_on :macos

  def install
    bin.install "jt"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jt --version")
  end
end
