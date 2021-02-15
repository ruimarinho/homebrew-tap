require "language/node"

class Gsts < Formula
  desc "Obtain and store AWS STS credentials by authenticating via G Suite SAML"
  homepage "https://github.com/ruimarinho/gsts"
  url "https://github.com/ruimarinho/gsts/archive/v3.0.3.tar.gz"
  sha256 "52d130b8d1b65c714b339a7b448f472165a66fd2d2bf275f3a90f569c9dcccbe"
  license "MIT"

  bottle :unneeded

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gsts --version")
  end
end
