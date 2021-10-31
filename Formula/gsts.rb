require "language/node"

class Gsts < Formula
  desc "Obtain and store AWS STS credentials by authenticating via G Suite SAML"
  homepage "https://github.com/ruimarinho/gsts"
  url "https://github.com/ruimarinho/gsts/archive/v3.0.7.tar.gz"
  sha256 "605e1c0b323f199da95b387b9208973c879f7b1c260199b4977f4ff70889faca"
  license "MIT"

  bottle :unneeded

  depends_on "node"

  def install
    ENV["PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD"]="1"

    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    (bin/"gsts").write_env_script libexec/"lib/node_modules/gsts/index.js", PLAYWRIGHT_BROWSERS_PATH: "0"
  end

  def post_install
    ENV["PLAYWRIGHT_BROWSERS_PATH"]="0"

    system "#{Formula["node"].bin}/node", "#{libexec}/lib/node_modules/gsts/node_modules/playwright/install.js"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gsts --version")
  end
end
