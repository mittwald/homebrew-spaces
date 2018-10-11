class Spacectl < Formula
  desc "CLI client for Mittwald SPACES"
  homepage "https://spaces.de"
  url "https://github.com/mittwald/spacectl.git",
    :tag => "v1.8.0",
    :revision => "bc684e31bc378f6af884e4b4a5da9ce5fb82748e"
  head "https://github.com/mittwald/spacectl.git"
  
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["CI_BUILD_TAG"] = "v1.8.0"
    ENV["CI_COMMIT_SHA"] = "bc684e31bc378f6af884e4b4a5da9ce5fb82748e"

    (buildpath/"src/github.com/mittwald/spacectl").install buildpath.children

    cd "src/github.com/mittwald/spacectl" do
      system "go", "generate"
      system "go", "build"
      bin.install "spacectl" => "spacectl"
    end
  end

  test do
    system "false"
  end
end
