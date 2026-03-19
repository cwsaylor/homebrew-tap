class Nib < Formula
  desc "Stream of consciousness notes in the terminal, backed by SQLite"
  homepage "https://github.com/cwsaylor/nib"
  url "https://github.com/cwsaylor/nib/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed"
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
