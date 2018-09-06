class Spacectl < Formula
  desc "CLI client for Mittwald SPACES"
  homepage "https://spaces.de"
  url "https://github.com/mittwald/spacectl.git",
    :tag => "v1.7.0",
    :revision => "7a749dbc5e8fab1992584110575b2d16e9c1016f"
  head "https://github.com/mittwald/spacectl.git"
  
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath

    (buildpath/"src/github.com/mittwald/spacectl").install buildpath.children

    cd "src/github.com/mittwald/spacectl" do
      system "go", "build"
      bin.install "spacectl" => "spacectl"
    end
  end

  test do
    system "false"
  end
end
