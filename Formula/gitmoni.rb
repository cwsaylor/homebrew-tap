class Gitmoni < Formula
  desc "Terminal UI to monitor git repositories for local and remote changes"
  homepage "https://github.com/cwsaylor/gitmoni"
  url "https://github.com/cwsaylor/gitmoni/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "7b45f4766db5c0aa43b20b92d7a0826d7ed82cf30910d66553bd3dc5c7ccf87b"
  license "MIT"

  head "https://github.com/cwsaylor/gitmoni.git", branch: "main"

  depends_on "go" => :build

  def install
    # If your main package is ./cmd/gitmoni, use that path. If it's at repo root, replace with "."
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.Version=#{version}"), "."
  end

  test do
    # Keep this minimal and deterministic. Prefer a flag that exits 0 and prints something stable.
    output = shell_output("#{bin}/gitmoni --version 2>&1")
    assert_match "gitmoni", output
  end
end
