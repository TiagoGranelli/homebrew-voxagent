class Voxagent < Formula
  desc "Hey Vox — local-first voice agent daemon for macOS"
  homepage "https://github.com/TiagoGranelli/voxagent"
  url "https://github.com/TiagoGranelli/voxagent/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "96b1ccc1a435ea2230988047869ca2ccad1d0f1cae595d9e1bc5017891a2f3b8"
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
