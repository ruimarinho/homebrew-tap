require "language/node"

class Gsts < Formula
  desc "Obtain and store AWS STS credentials by authenticating via G Suite SAML"
  homepage "https://github.com/ruimarinho/gsts"
  url "https://github.com/ruimarinho/gsts/archive/v5.0.3.tar.gz"
  sha256 "dd93f40811e7b5950026fd70fda697ea1b02c5c403535f071bb78398b73ef8c0"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    (bin/"gsts").write_env_script libexec/"lib/node_modules/gsts/index.js", PLAYWRIGHT_BROWSERS_PATH: "0"
  end

  def post_install
    ENV["PLAYWRIGHT_BROWSERS_PATH"]="0"

    system "#{Formula["node"].bin}/node", "#{libexec}/lib/node_modules/gsts/node_modules/playwright/cli.js", "install"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gsts --version")
  end
end
