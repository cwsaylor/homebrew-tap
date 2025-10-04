class Gitmoni < Formula
  desc "Terminal UI to monitor git repositories for local and remote changes"
  homepage "https://github.com/cwsaylor/gitmoni"
  url "https://github.com/cwsaylor/gitmoni/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "daf1168c0a0e42ef76f5e78bd4432e9920c51af143ab3c822b7e594dda986374"
  license "MIT"

  head "https://github.com/cwsaylor/gitmoni.git", branch: "main"

  depends_on "go" => :build

  def install
    # If your main package is ./cmd/gitmoni, use that path. If it's at repo root, replace with "."
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.Version=1.0.2"), "."
  end

  test do
    # Keep this minimal and deterministic. Prefer a flag that exits 0 and prints something stable.
    output = shell_output("#{bin}/gitmoni --version 2>&1")
    assert_match "gitmoni", output
  end
end
