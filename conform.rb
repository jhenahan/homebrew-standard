class Conform < Formula
  desc "Policy enforcement for your pipelines."
  homepage "https://github.com/siderolabs/conform"
  version "v0.1.0-alpha.27"
  on_macos do
    on_arm do
      url "https://github.com/siderolabs/conform/releases/download/v0.1.0-alpha.27/conform-darwin-arm64"
      sha256 "e1f44ea33242226d78bea2c90daa12b35add1a170769e6244db2f3ff73c9ea36"
    end
    on_intel do
      url "https://github.com/siderolabs/conform/releases/download/v0.1.0-alpha.27/conform-darwin-amd64"
      sha256 "177b542e05dee3466fd60c49c729e81d660db50ff2b2f7ac4bb080a250cb0c42"
    end
  end
  license "MPL-2.0"

  # depends_on "cmake" => :build

  def install
    on_macos do
      on_arm do
        bin.install "conform-darwin-arm64" => "conform"
      end
      on_intel do
        bin.install "conform-darwin-amd64" => "conform"
      end
    end
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test conform`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    assert_equal self.version, shell_output("#{bin}/conform version | awk '/Tag/ { print $2 }'").strip
  end
end
