class Jt < Formula
  desc "Jira as a remote VCS for agent workflows"
  homepage "https://github.com/owenoclee/jt"
  url on_arch_conditional(
    arm:   "https://github.com/owenoclee/jt/releases/download/v0.4.0/jt-aarch64-apple-darwin.tar.gz",
    intel: "https://github.com/owenoclee/jt/releases/download/v0.4.0/jt-x86_64-apple-darwin.tar.gz",
  )
  sha256 on_arch_conditional(
    arm:   "6c4d121d968f161714172f5b80d1cd79980b0e25b6b92d67d94cd8e721ecb348",
    intel: "35699eb8cb40bf035d7e5a95870731bc13234b5396c4f61fdbb2e188959b2d45",
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
