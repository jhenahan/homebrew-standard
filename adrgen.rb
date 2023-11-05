class Adrgen < Formula
  desc "A command-line tool for generating and managing Architecture Decision Records "
  homepage "https://github.com/asiermarques/adrgen"
  version "v0.4.1-beta"
  on_macos do
    on_arm do
      url "https://github.com/asiermarques/adrgen/releases/download/v0.4.1-beta/adrgen_Darwin_arm64.tar.gz"
      sha256 "c42b924a787fe9b925c09ade6ff78777145813f6607da714ba618a2307aef76a"
    end
    on_intel do
      url "https://github.com/asiermarques/adrgen/releases/download/v0.4.1-beta/adrgen_Darwin_x86_64.tar.gz"
      sha256 "a6962d90de3ed3db56ee728e8aca58e9b69e21634e2f9e1d65962d84efd28f00"
    end
  end

  license "MIT"

  def install
    bin.install "adrgen"
  end

  test do
    assert_equal "version: #{self.version}", shell_output("#{bin}/adrgen version").strip
  end
end
