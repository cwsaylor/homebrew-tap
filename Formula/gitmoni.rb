class Gitmoni < Formula
  desc "Terminal UI to monitor git repositories for local and remote changes"
  homepage "https://github.com/cwsaylor/gitmoni"
  url "https://github.com/cwsaylor/gitmoni/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "02982da60e54e27ed4b6c2fcd5f95bf8ef026588548274ae20fc850df3e0656f"
  license "MIT"

  head "https://github.com/cwsaylor/gitmoni.git", branch: "main"

  depends_on "go" => :build

  def install
    # If your main package is ./cmd/gitmoni, use that path. If it's at repo root, replace with "."
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./gitmoni"
  end

  test do
    # Keep this minimal and deterministic. Prefer a flag that exits 0 and prints something stable.
    output = shell_output("#{bin}/gitmoni --version 2>&1")
    assert_match "gitmoni", output
  end
end
