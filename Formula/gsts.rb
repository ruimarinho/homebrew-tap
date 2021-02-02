require "language/node"

class Gsts < Formula
  desc "Obtain and store AWS STS credentials by authenticating via G Suite SAML"
  homepage "https://github.com/ruimarinho/gsts"
  url "https://github.com/ruimarinho/gsts/archive/v3.0.0.tar.gz"
  sha256 "1756ad6c3bfb86994ffc3dcc432e6a7166884f3dea51f8736bf25a9d7dddda1d"
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
