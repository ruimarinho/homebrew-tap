# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class ShellyUpdater < Formula
  desc "A Shelly device firmware updater based on zeroconf (or bonjour) discovery for local networks using their built-in Over-The-Air update interface. It is suited for network setups where IoT devices do not have internet connectivity."
  homepage "https://github.com/ruimarinho/shelly-updater"
  version "1.1.0"
  license "MIT"
  bottle :unneeded

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/ruimarinho/shelly-updater/releases/download/v1.1.0/shelly-updater_1.1.0_macOS_x86_64.tar.gz"
    sha256 "5a29be7e2ea3e1c551d1ec0b07da08efa2ded893eb4623533c2558aa891306c4"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/ruimarinho/shelly-updater/releases/download/v1.1.0/shelly-updater_1.1.0_Linux_x86_64.tar.gz"
    sha256 "b9accdb394e7a0bb022b76e0c465916a5905601c22f5cbdbb9528600f33b766d"
  end

  def install
    bin.install "shelly-updater"
  end

  test do
    system "#{bin}/shelly-updater --version"
  end
end