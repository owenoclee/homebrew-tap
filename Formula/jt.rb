class Jt < Formula
  desc "Jira as a remote VCS for agent workflows"
  homepage "https://github.com/owenoclee/jt"
  url on_arch_conditional(
    arm:   "https://github.com/owenoclee/jt/releases/download/v0.3.0/jt-aarch64-apple-darwin.tar.gz",
    intel: "https://github.com/owenoclee/jt/releases/download/v0.3.0/jt-x86_64-apple-darwin.tar.gz",
  )
  sha256 on_arch_conditional(
    arm:   "759623884255a70d8df9a7cdbb61ac87ed3d00093a0506fe9d17f343808431b3",
    intel: "da8936d25d0468118d4833d2f4d5638b781326ddf9f1249d133e3a7bce224acc",
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
