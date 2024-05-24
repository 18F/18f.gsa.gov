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

  # Minimal test to make sure photo tags are returned at all.
  # Testing file paths is proving tricky.
  describe "#photo_tag" do
    before(:each) { Author.files_dir = files_dir }
    let(:config) { { "baseurl" => "spec/support" } }

    let(:author) { Author.find_by(slug: "matt-cloyd") }
    let(:photo_tag) { author.photo_tag(config: config) }
    it "returns a photo tag" do
      expect(photo_tag).to be_a String
    end
  end
end
