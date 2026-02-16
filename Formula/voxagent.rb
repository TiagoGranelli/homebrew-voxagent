class Voxagent < Formula
  desc "Hey Vox — local-first voice agent daemon for macOS"
  homepage "https://github.com/TiagoGranelli/voxagent"
  url "https://github.com/TiagoGranelli/voxagent/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "e1b4a1160cd68606ef354e8446ad5c99b396c729f01a1ed3229d38332ac057b2"
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
