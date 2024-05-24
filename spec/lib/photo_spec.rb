require_relative "../../lib/photo"

describe Photo do
  let(:slug) { "matt-cloyd" }
  let(:full_name) { "Matt Cloyd" }
  let(:config) { {"baseurl" => "spec/support"} }
  let(:photo) { Photo.new(slug: slug, full_name: full_name, config: config) }

  describe "#tag" do
    context "for an author with a photo" do
      it "returns a photo tag" do
        expect(photo.tag(pre: "spec/support")).to match(/Photo of post author Matt Cloyd/)
      end
    end
    context "for an author with no photo" do
      let(:slug) { "no-face" }
      let(:full_name) { "No Face" }
      it "returns a placeholder photo tag" do
        expect(photo.tag(pre: "spec/support")).to match(/Placeholder image for post author No Face \(18F logo\)/)
      end
    end
  end
end
