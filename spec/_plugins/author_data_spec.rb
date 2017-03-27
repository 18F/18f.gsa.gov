require_relative '../../_plugins/author_data'

RSpec.describe SiteData::AuthorData do
  before(:each) do
    root = File.dirname(File.dirname(__FILE__))

    @author_data = SiteData::AuthorData.new(root)
    @published_authors = @author_data.published_authors
    @unpublished_authors = @author_data.unpublished_authors
    @all_authors = @author_data.all_authors
  end

  context 'with YAML frontmatter -- ' do
    it 'confirms that a exists' do
      exists = @author_data.exists? 'author'
      expect(exists).to eq true
    end

    it 'confirms that a missing file does not exist' do
      exists = @author_data.exists? 'authored'
      expect(exists).to eq false
    end

    it 'fetches a key' do
      author_name = @author_data.fetch('author', 'name')
      expect(author_name).to eq 'aaron'
    end

    it 'fetches a key that is not there' do
      author_name = @author_data.fetch('author', 'bogus_key')
      expect(author_name).not_to eq 'aaron'
    end

    it 'it cannot fetch a file that does not exist' do
      bogus_file_name = 'authored'
      exists = @author_data.exists? bogus_file_name
      expect(exists).to eq false

      author_name = @author_data.fetch(bogus_file_name, 'name')
      expect(author_name).to eq nil
    end

    it 'can create a file path from a string' do
      actual = @author_data.create_file_path('author')
      expected = File.join(@author_data.path, 'author.md')
      expect(expected).to eq actual
    end

    it 'can update a file without referencing a file extension' do
      author_name = @author_data.fetch('author', 'name')
      expect(author_name).to eq 'aaron'

      @author_data.update('author', 'name', 'brian')
      author_name = @author_data.fetch('author', 'name')
      expect(author_name).to eq 'brian'

      @author_data.update('author', 'name', 'aaron')
      author_name = @author_data.fetch('author', 'name')
      expect(author_name).to eq 'aaron'
    end

    it 'can update a file by referencing a file extension' do
      author_name = @author_data.fetch('author', 'name')
      expect(author_name).to eq 'aaron'

      @author_data.update('author.md', 'name', 'brian')
      author_name = @author_data.fetch('author', 'name')
      expect(author_name).to eq 'brian'

      @author_data.update('author.md', 'name', 'aaron')
      author_name = @author_data.fetch('author', 'name')
      expect(author_name).to eq 'aaron'
    end

    it 'does not update a file if it does not need updating' do
      author_name = @author_data.fetch('author', 'name')
      expect(author_name).to eq 'aaron'

      @author_data.update('author.md', 'name', 'aaron')
      author_name = @author_data.fetch('author', 'name')
      expect(author_name).to eq 'aaron'
    end

    it 'can update and leave the content intact' do
      author_name = @author_data.fetch('author', 'name')
      expect(author_name).to eq 'aaron'

      file_path = @author_data.create_file_path('author')
      num_lines = File.readlines(file_path).count
      @author_data.update('author.md', 'name', 'brian')
      num_lines_updated = File.readlines(file_path).count
      expect(num_lines_updated).to eq num_lines

      @author_data.update('author.md', 'name', 'aaron')
      author_name = @author_data.fetch('author', 'name')
      expect(author_name).to eq 'aaron'
    end
  end

  context 'given a file with content and YAML frontmatter' do
    it 'confirms that a exists' do
      exists = @author_data.exists? 'author_with_content'
      expect(exists).to eq true
    end

    it 'confirms that a missing file does not exist' do
      exists = @author_data.exists? 'authored'
      expect(exists).to eq false
    end

    it 'fetches a key' do
      author_name = @author_data.fetch('author_with_content', 'name')
      expect(author_name).to eq 'burt'
    end

    it 'fetches a key that is not there' do
      author_name = @author_data.fetch('author_with_content', 'bogus_key')
      expect(author_name).not_to eq 'burt'
    end

    it 'can update a file without referencing a file extension' do
      author_name = @author_data.fetch('author_with_content', 'name')
      expect(author_name).to eq 'burt'

      @author_data.update('author_with_content', 'name', 'brian')
      author_name = @author_data.fetch('author_with_content', 'name')
      expect(author_name).to eq 'brian'

      @author_data.update('author_with_content', 'name', 'burt')
      author_name = @author_data.fetch('author_with_content', 'name')
      expect(author_name).to eq 'burt'
    end

    it 'can update a file by referencing a file extension' do
      author_name = @author_data.fetch('author_with_content', 'name')
      expect(author_name).to eq 'burt'

      @author_data.update('author_with_content.md', 'name', 'brian')
      author_name = @author_data.fetch('author_with_content', 'name')
      expect(author_name).to eq 'brian'

      @author_data.update('author_with_content.md', 'name', 'burt')
      author_name = @author_data.fetch('author_with_content', 'name')
      expect(author_name).to eq 'burt'
    end

    it 'can update and leave the content intact' do
      author_name = @author_data.fetch('author_with_content', 'name')
      expect(author_name).to eq 'burt'

      file_path = @author_data.create_file_path('author_with_content')
      num_lines = File.readlines(file_path).count
      @author_data.update('author_with_content.md', 'name', 'brian')
      num_lines_updated = File.readlines(file_path).count
      expect(num_lines_updated).to eq num_lines

      @author_data.update('author_with_content.md', 'name', 'burt')
      author_name = @author_data.fetch('author_with_content', 'name')
      expect(author_name).to eq 'burt'
    end

    it 'does not update a file if it does not need updating' do
      author_name = @author_data.fetch('author_with_content', 'name')
      expect(author_name).to eq 'burt'

      @author_data.update('author_with_content.md', 'name', 'burt')
      author_name = @author_data.fetch('author_with_content', 'name')
      expect(author_name).to eq 'burt'
    end
  end

  describe 'class variables' do
    it "generates a list of 'published_authors'" do
      expect(@published_authors).to be_kind_of(Array)
      expect(@published_authors).not_to be_empty
      expect(@published_authors.size).to be > 0
    end

    it "generates a list of 'unpublished_authors'" do
      expect(@unpublished_authors).to be_kind_of(Array)
      expect(@unpublished_authors).not_to be_empty
      expect(@unpublished_authors.size).to be > 0
    end

    it "'all_authors' should be the sum of 'unpublished_authors' and 'published_authors'" do
      all_authors_size = @unpublished_authors.size + @published_authors.size
      expect(@all_authors.size).to eq all_authors_size
    end

    it "aaron.md is in 'all_authors'" do
      aaron_included = @all_authors.include? 'aaron.md'
      expect(aaron_included).to be true
    end

    it "aaron.md is in 'published_authors'" do
      aaron_included = @published_authors.include? 'aaron.md'
      expect(aaron_included).to be true
    end

    it "aaron.md is not in 'unpublished_authors'" do
      aaron_included = @unpublished_authors.include? 'aaron.md'
      expect(aaron_included).to be false
    end

    it "unpublished_author.md is in 'all_authors'" do
      unpublished_included = @all_authors.include? 'unpublished_author.md'
      expect(unpublished_included).to be true
    end

    it "unpublished_author.md is not in 'published_authors'" do
      unpublished_included = @published_authors.include? 'unpublished_author.md'
      expect(unpublished_included).to be false
    end

    it "unpublished_author.md is in 'unpublished_authors'" do
      unpublished_included = @unpublished_authors.include? 'unpublished_author.md'
      expect(unpublished_included).to be true
    end
  end
end
