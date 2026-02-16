class Voxagent < Formula
  desc "Hey Vox — local-first voice agent daemon for macOS"
  homepage "https://github.com/TiagoGranelli/voxagent"
  url "https://github.com/TiagoGranelli/voxagent/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "4c470cdc8feb0d8c23350680dea355aa6dc525345a9dd50b144a8245727376a3"
  license "MIT"

  depends_on :macos
  depends_on xcode: ["16.0", :build]

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/voxagent"
  end

  test do
    assert_match "USAGE", shell_output("#{bin}/voxagent --help", 0)
  end
end
