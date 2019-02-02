class Spacectl < Formula
  desc "CLI client for Mittwald SPACES"
  homepage "https://spaces.de"
  url "https://github.com/mittwald/spacectl.git",
    :tag => "v1.11.0",
    :revision => "8650250294ef139181ebf2e008866b696fc03636"
  head "https://github.com/mittwald/spacectl.git"
  
  depends_on "go" => :build

  def install
    ENV["CI_BUILD_TAG"] = "v1.11.0"
    ENV["CI_COMMIT_SHA"] = "8650250294ef139181ebf2e008866b696fc03636"

    system "go", "generate"
    system "go", "build"
    bin.install "spacectl" => "spacectl"
  end

  test do
    system "false"
  end
end
