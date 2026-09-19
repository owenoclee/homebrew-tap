class Jt < Formula
  desc "Jira as a remote VCS for agent workflows"
  homepage "https://github.com/owenoclee/jt"
  url on_arch_conditional(
    arm:   "https://github.com/owenoclee/jt/releases/download/v0.5.0/jt-aarch64-apple-darwin.tar.gz",
    intel: "https://github.com/owenoclee/jt/releases/download/v0.5.0/jt-x86_64-apple-darwin.tar.gz",
  )
  sha256 on_arch_conditional(
    arm:   "4751bfac25633e54f157e794261e504ec0ede00c097e85327e8ca14a8bce24bf",
    intel: "413d893e88090daa32a22d1d6067d7581a197ba93aa25ee4b657aec5941fdc9d",
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
