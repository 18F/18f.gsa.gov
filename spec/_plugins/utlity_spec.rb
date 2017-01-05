require_relative '../../_plugins/utility'
require 'pry'

RSpec.describe Jekyll::Utility do
  class UtilityClass
  end

  before(:each) do
    @utility_class = UtilityClass.new
    @utility_class.extend(Jekyll::Utility)

    @nav_item = {
      "text" => "Blog",
      "href" => "blog/index.html",
      "permalink" => "/blog/",
      "permalink_alt" => "/blog/",
      "in_menu" => true,
      "in_drawer" => true,
      "in_footer" => true,
      "children" => nil
    }

    @project_nav_item = {
      "text" => "fec-gov",
      "href" => "project/fec-gov/index.html",
      "permalink" => "/project/fec-gov/",
      "permalink_alt" => "/project/",
      "in_menu" => true,
      "in_drawer" => true,
      "in_footer" => true,
      "children" => nil
    }

    @project_nav_item_children = {
      "text" => "Project",
      "href" => "project/index.html",
      "permalink" => "/project/",
      "permalink_alt" => "/project/",
      "in_menu" => true,
      "in_drawer" => true,
      "in_footer" => true,
      "children" => [
        @project_nav_item
      ]
    }
    # binding.pry
    @nav_item_with_collection = @nav_item.dup
    @nav_item_with_multiple_collections = @nav_item.dup
    @nav_item_with_collection['collections'] = []
    @nav_item_with_multiple_collections['collections'] = []
    @nav_item_with_collection['collections'] << 'posts'
    @nav_item_with_multiple_collections['collections'] << 'posts'

    @first_post = YAML.load(File.read(File.join(Dir.pwd, 'spec/_posts/page.rb')))
    @project_page = YAML.load(File.read(File.join(Dir.pwd, 'spec/_posts/project_page.rb')))
    @post_url = @first_post['url']
    @post_url = @utility_class.clip_char(@post_url.to_s.downcase, '/')
  end
  describe '#clip_char' do
    context 'single parameter, string' do
      it 'removes dashes from the beginning of a string' do
        expect(@utility_class.clip_char('-text')).to eq 'text'
      end

      it 'removes dashes from the end of a string' do
        expect(@utility_class.clip_char('text-')).to eq 'text'
      end

      it 'removes dashes from both ends of a string' do
        expect(@utility_class.clip_char('-text-')).to eq 'text'
      end

      it 'does not remove dashes from within a string' do
        expect(@utility_class.clip_char('-text-me-')).to eq 'text-me'
      end
    end

    context 'two parameters: string, character' do
      it 'removes other characters from the ends if specified' do
        expect(@utility_class.clip_char('/text/', '/')).to eq 'text'
      end

      it 'works for letters' do
        expect(@utility_class.clip_char('hannah', 'h')).to eq 'anna'
      end

      it 'works for numbers' do
        expect(@utility_class.clip_char('101', '1')).to eq '0'
      end
    end
  end

  describe '#hash_link' do
    it 'adds a hash to the beginning of a string' do
      expect(@utility_class.hash_link('text')).to eq '#text'
    end

    it 'does not add a hash if it is already there' do
      expect(@utility_class.hash_link('#text')).to eq '#text'
    end
  end

  describe '#matches_url' do
    it 'strips forward slashes' do
      expect(@utility_class.matches_url('/text/', 'text')).to be true
      expect(@utility_class.matches_url('/text', 'text')).to be true
      expect(@utility_class.matches_url('text/', 'text')).to be true
    end

    it 'reverse strips forward slashes' do
      expect(@utility_class.matches_url('text', '/text/')).to be true
      expect(@utility_class.matches_url('text', '/text')).to be true
      expect(@utility_class.matches_url('text', 'text/')).to be true
    end

    it 'does not strip double forward slashes' do
      expect(@utility_class.matches_url('//text', 'text/')).to be_nil
      expect(@utility_class.matches_url('text//', 'text/')).to be_nil
      expect(@utility_class.matches_url('text//', 'text//')).to be true
    end
  end

  describe '#matches_collections' do
    it 'returns nil if the nav_item does not have an associated collection' do
      actual = @utility_class.matches_collections(@first_post, @nav_item)
      expect(actual).to be_nil
    end

    it 'returns true if the nav_item does not have an associated collection' do
      actual = @utility_class.matches_collections(@first_post, @nav_item_with_collection)
      expect(actual).to be true
    end

    it 'returns true if the nav_item does not have an associated collection' do
      actual = @utility_class.matches_collections(@first_post, @nav_item_with_multiple_collections)
      expect(actual).to be true
    end
  end

  describe '#matches_permalink_alt' do
    it 'returns true if the url matches the nav item' do
      actual = @utility_class.matches_permalink_alt('blog', @nav_item)
      expect(actual).to be true
    end

    it 'does not match if the url does not match the nav item' do
      actual = @utility_class.matches_permalink_alt(@post_url, @nav_item)
      expect(actual).to be_nil
    end

    it "matches a nav_item 'permalink_alt' with a post's 'url'" do
      actual = @utility_class.matches_permalink_alt('/something-else/', @nav_item)
      expect(actual).to be_nil
    end
  end

  describe '#matches_url_parent' do
    it 'checks if the post matches the nav item' do
      actual = @utility_class.matches_url_parent(@first_post, @nav_item)
      expect(actual).to be_nil

      actual = @utility_class.matches_url_parent(@project_page, @project_nav_item)
      expect(actual).to be true
    end

    it 'checks if the post matches the nav item with a collection attribtue' do
      actual = @utility_class.matches_url_parent(@first_post, @nav_item_with_collection)
      expect(actual).to be true

      actual = @utility_class.matches_url_parent(@project_page, @project_nav_item)
      expect(actual).to be true
    end
  end

  describe '#crawl_pages' do
    it 'checks top level nav items' do
      actual = @utility_class.crawl_pages(@project_nav_item, '/blog/')
      expect(actual).to be_nil

      actual = @utility_class.crawl_pages(@nav_item, '/blog/')
      expect(@utility_class.match).to match @nav_item
    end

    it 'does not match child nav items to parent nav items' do
      actual = @utility_class.crawl_pages(@project_nav_item, '/project/fec-gov/')
      expect(@utility_class.match).to match @project_nav_item
    end

    it 'matches with parent if it is an exact match' do
      actual = @utility_class.crawl_pages(@project_nav_item_children, '/project/')
      expect(@utility_class.match).to match @project_nav_item_children
    end

    it 'matches with the child if it is an exact match' do
      actual = @utility_class.crawl_pages(@project_nav_item_children, '/project/fec-gov/')
      expect(@utility_class.match).to match @project_nav_item
    end
  end
end

