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
    let(:config) { {"baseurl" => "spec/support"} }

    let(:author) { Author.find_by(slug: "matt-cloyd") }
    let(:photo_tag) { author.photo_tag(config: config) }
    it "returns a photo tag" do
      expect(photo_tag).to be_a String
    end
  end

  describe "#published?" do
    let(:post_authors) { ["matt-cloyd"] }
    context "a published author" do
      let(:author) { Author.find_by(slug: "matt-cloyd") }
      it "returns true" do
        expect(author.published?(list: post_authors)).to be true
      end
    end
    context "an unpublished author" do
      let(:author) { Author.find_by(slug: "no-face") }
      it "returns false" do
        expect(author.published?(list: post_authors)).to be false
      end
    end
  end

  def set_author_file_published(slug, status = true)
    path = author_file_path(slug)
    data = YAML.load_file(path)
    data["published"] = status
    File.write(path, data.to_yaml)
  end

  def author_file_published?(slug)
    YAML.load_file(author_file_path(slug)).fetch("published")
  end

  def author_file_path(slug)
    "spec/support/author_files/#{slug}.md"
  end

  describe "#update_published!" do
    before(:each) do
      set_author_file_published "matt-cloyd", true
      set_author_file_published "no-face", false
    end
    let(:author) { Author.find_by(slug: slug) }

    context "publishing" do
      let(:post_authors) { ["matt-cloyd", "no-face"] }
      context "a formerly published author" do
        let(:slug) { "matt-cloyd" }
        it "sets the file to published: true" do
          author.update_published!(list: post_authors)
          expect(author_file_published?(slug)).to be true
        end
      end
      context "a formerly unpublished author" do
        let(:slug) { "no-face" }
        it "sets the file to published: true" do
          author.update_published!(list: post_authors)
          expect(author_file_published?(slug)).to be true
        end
      end
    end
    context "un-publishing" do
      let(:post_authors) { [] }
      context "a formerly published author" do
        let(:slug) { "matt-cloyd" }
        it "sets the file to published: false" do
          author.update_published!(list: post_authors)
          expect(author_file_published?(slug)).to be false
        end
      end
      context "a formerly unpublished author" do
        let(:slug) { "no-face" }
        it "sets the file to published: false" do
          author.update_published!(list: post_authors)
          expect(author_file_published?(slug)).to be false
        end
      end
    end
  end
end
