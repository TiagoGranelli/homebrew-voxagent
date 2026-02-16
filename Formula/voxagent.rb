class Voxagent < Formula
  desc "Hey Vox — local-first voice agent daemon for macOS"
  homepage "https://github.com/TiagoGranelli/voxagent"
  url "https://github.com/TiagoGranelli/voxagent/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "4a0403a229eab3a14515370802ace7ff55b70952f247e9b4d2491e6d0a8cd02e"
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
