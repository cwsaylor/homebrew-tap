class Nib < Formula
  desc "Stream of consciousness notes in the terminal, backed by SQLite"
  homepage "https://github.com/cwsaylor/nib"
  url "https://github.com/cwsaylor/nib/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "353232fc7d8d6d669235d6154419ba387db702ab00769edbd947efd79a34201f"
  license "MIT"

  head "https://github.com/cwsaylor/nib.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.Version=#{version}"), "."
  end

  test do
    output = shell_output("#{bin}/nib --version 2>&1")
    assert_match "nib", output
  end
end
