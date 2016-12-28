require_relative '../../_plugins/author_data'
require 'pry'

RSpec.describe SiteData::AuthorData do
	before(:each) do
    file = File.dirname(File.dirname(__FILE__))
  	@author_data = SiteData::AuthorData.new(file)
  end

  context "given a file with only YAML frontmatter" do
		it "it confirms that a exists" do
    	exists = @author_data.exists? 'author'
    	expect(exists).to eq true
    end

    it "it confirms that a missing file doesn't exist" do
    	exists = @author_data.exists? 'authored'
    	expect(exists).to eq false
    end

    it "it fetches a key" do
    	author_name = @author_data.fetch('author', 'name')
    	expect(author_name).to eq 'aaron'
    end

    it "it't fetches a key that isn't there" do
    	author_name = @author_data.fetch('author', 'bogus_key')
    	expect(author_name).not_to eq 'aaron'
    end
  end
end
