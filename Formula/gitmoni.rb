class Gitmoni < Formula
  desc "Terminal UI to monitor git repositories for local and remote changes"
  homepage "https://github.com/cwsaylor/gitmoni"
  url "https://github.com/cwsaylor/gitmoni/archive/refs/tags/v0.8.1.tar.gz"
  sha256 "95453abee59a82765ca214daaf45d9d109514e229bb815445b3802a291cae6b3"
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
