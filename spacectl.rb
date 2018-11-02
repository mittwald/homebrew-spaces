class Spacectl < Formula
  desc "CLI client for Mittwald SPACES"
  homepage "https://spaces.de"
  url "https://github.com/mittwald/spacectl.git",
    :tag => "v1.10.0",
    :revision => "baac43487f1aff3c20b2ce9b971f1d6e54d9781e"
  head "https://github.com/mittwald/spacectl.git"
  
  depends_on "go" => :build

  def install
    ENV["CI_BUILD_TAG"] = "v1.10.0"
    ENV["CI_COMMIT_SHA"] = "baac43487f1aff3c20b2ce9b971f1d6e54d9781e"

    system "go", "generate"
    system "go", "build"
    bin.install "spacectl" => "spacectl"
  end

  test do
    system "false"
  end
end
