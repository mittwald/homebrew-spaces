class Spacectl < Formula
  desc "CLI client for Mittwald SPACES"
  homepage "https://spaces.de"
  url "https://github.com/mittwald/spacectl/archive/v1.6.0.tar.gz"
  sha256 "5e407f6c87e46603285aba5dd1e7f91a541cbea6cbc6578ba0cea5fbce56e12e"

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
