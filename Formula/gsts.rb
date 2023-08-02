require "language/node"

class Gsts < Formula
  desc "Obtain and store AWS STS credentials by authenticating via G Suite SAML"
  homepage "https://github.com/ruimarinho/gsts"
  url "https://github.com/ruimarinho/gsts/archive/v5.0.2.tar.gz"
  sha256 "da71331e16a7025789faa669fb4cb7a6aa8ce802159952ebf481e6b77602b7e7"
  license "MIT"

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
