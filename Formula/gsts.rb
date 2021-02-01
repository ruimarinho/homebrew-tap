require "language/node"

class Gsts < Formula
  desc "Obtain and store AWS STS credentials by authenticating via G Suite SAML"
  homepage "https://github.com/ruimarinho/gsts"
  url "https://github.com/ruimarinho/gsts/archive/v2.4.3.tar.gz"
  sha256 "5df2f15aadb246c99ddc28186e5c33dbb0c15d138eeed5e93fd5dc1d1166c38b"
  license "MIT"

  bottle :unneeded

  depends_on "node@12"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gsts --version")
  end
end
