require "language/node"

class Gsts < Formula
  desc "Obtain and store AWS STS credentials by authenticating via G Suite SAML"
  homepage "https://github.com/ruimarinho/gsts"
  url "https://github.com/ruimarinho/gsts/archive/v3.0.2.tar.gz"
  sha256 "e87e7c9627d49a77cf632bc6269f215a59e624d0170785b0bb6ec49355247068"
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
