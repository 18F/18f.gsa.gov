require_relative "../../lib/author"

RSpec.describe Author do
  let(:files_dir) { "spec/support/author_files" }

  describe ".files" do
    context "default" do
      it "has a default directory" do
        expect(Author.files_dir).to eq "_authors"
      end
    end
    context "with a given directory" do
      it "reflects the given directory" do
        Author.files_dir = files_dir
        expect(Author.files_dir).to eq "spec/support/author_files"
        expect(Author.files.empty?).to be false
      end
    end
  end

  describe ".find_by" do
    before(:each) { Author.files_dir = files_dir }
    context "finding an existing author" do
      let(:slug) { "matt-cloyd" }
      it "retrieves the author data from file" do
        expect(Author.find_by(slug: slug)).to respond_to(:data)
      end
    end
    context "finding a missing author" do
      let(:slug) { "nobody" }
      it "returns nil" do
        expect(Author.find_by(slug: slug)).to be nil
      end
    end
  end

  describe ".find_by!" do
    before(:each) { Author.files_dir = files_dir }
    context "finding an existing author" do
      let(:slug) { "matt-cloyd" }
      it "retrieves the author data from file" do
        expect(Author.find_by!(slug: slug)).to respond_to(:data)
      end
    end
    context "finding a missing author" do
      let(:slug) { "nobody" }
      it "returns nil" do
        expect { Author.find_by!(slug: slug) }.to raise_error RuntimeError
      end
    end
  end

  # @smell This matches the coupling in lib/author
  # Ideally this should be tested in AuthorPhoto, not here,
  #   but it's not important enough at the moment.
  describe "#photo_tag" do
    before(:each) { Author.files_dir = files_dir }
    let(:config) { { "baseurl" => "spec/support" } }

    context "for an author with a photo" do
      let(:author) { Author.find_by(slug: "matt-cloyd") }
      let(:photo_tag) { author.photo_tag(config: config) }
      it "returns a photo tag" do
        expect(photo_tag).to match(/Photo of post author Matt Cloyd/)
      end
    end
    context "for an author with no photo" do
      let(:author) { Author.find_by(slug: "no-face") }
      let(:photo_tag) { author.photo_tag(config: config) }
      it "returns a placeholder photo tag" do
        expect(photo_tag).to match(/Placeholder image for post author No Face \(18F logo\)/)
      end
    end
  end
end
