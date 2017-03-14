require_relative '../../_plugins/utility'

RSpec.describe Jekyll::Utility do
  class UtilityClass
  end

  before(:each) do
    @utility_class = UtilityClass.new
    @utility_class.extend(Jekyll::Utility)

    @nav_items = YAML.safe_load(File.read(File.join(Dir.pwd, 'spec/_data/navigation.yml')))['assigned']

    @nav_item_join = YAML.safe_load(File.read(File.join(Dir.pwd, 'spec/_data/join.yml')))

    blog_variations = YAML.safe_load(File.read(File.join(Dir.pwd, 'spec/_data/blog.yml')))
    @nav_item_blog = blog_variations['blog']
    @nav_item_blog_single_collection = blog_variations['blog_single_collection']
    @nav_item_blog_collectionless = blog_variations['blog_collectionless']

    project_variations = YAML.safe_load(File.read(File.join(Dir.pwd, 'spec/_data/project.yml')))
    @nav_item_project = project_variations['project']
    @nav_item_project_with_children = project_variations['project_with_children']
    @nav_item_project_child = @nav_item_project_with_children['children'][0]

    @first_post = YAML.safe_load(File.read(File.join(Dir.pwd, 'spec/_posts/page.rb')))
    @project_page = YAML.safe_load(File.read(File.join(Dir.pwd, 'spec/_posts/project_page.rb')))
    @post_url = @first_post['url']
    @post_url = @utility_class.clip_char(@post_url.to_s.downcase, '/')

    @projects = YAML.safe_load(File.read(File.join(Dir.pwd, 'spec/_data/projects.yml')))
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
      actual = @utility_class.matches_collections(@first_post, @nav_item_blog_collectionless)
      expect(actual).to be_nil
    end

    it 'returns true if the nav_item does not have an associated collection' do
      actual = @utility_class.matches_collections(@first_post, @nav_item_blog_single_collection)
      expect(actual).to be true
    end

    it 'returns true if the nav_item does not have an associated collection' do
      actual = @utility_class.matches_collections(@first_post, @nav_item_blog)
      expect(actual).to be true
    end
  end

  describe '#matches_permalink_alt' do
    it 'returns true if the url matches the nav item' do
      actual = @utility_class.matches_permalink_alt('tags', @nav_item_blog_collectionless)
      expect(actual).to be true
    end

    it 'does not match if the url does not match the nav item' do
      actual = @utility_class.matches_permalink_alt(@post_url, @nav_item_blog_collectionless)
      expect(actual).to be_nil
    end

    it "matches a nav_item 'permalink_alt' with a post's 'url'" do
      actual = @utility_class.matches_permalink_alt(
        '/something-else/',
        @nav_item_blog_collectionless
      )
      expect(actual).to be_nil
    end
  end

  describe '#matches_url_parent' do
    it 'checks if the post matches the nav item' do
      actual = @utility_class.matches_url_parent(@first_post, @nav_item_blog_collectionless)
      expect(actual).to be_nil

      actual = @utility_class.matches_url_parent(@project_page, @nav_item_project)
      expect(actual).to be true
    end

    it 'checks if the post matches the nav item with a collection attribtue' do
      actual = @utility_class.matches_url_parent(@first_post, @nav_item_blog_single_collection)
      expect(actual).to be true

      actual = @utility_class.matches_url_parent(@project_page, @nav_item_project)
      expect(actual).to be true
    end
  end

  describe '#crawl_pages' do
    it 'checks top level nav items' do
      @utility_class.crawl_pages(@nav_item_project, '/blog/')
      expect(@utility_class.match).to be_nil

      @utility_class.crawl_pages(@nav_item_blog_collectionless, '/blog/')
      expect(@utility_class.match).to match @nav_item_blog_collectionless
    end

    it 'does not match child nav items to parent nav items' do
      @utility_class.crawl_pages(@nav_item_project, '/what-we-deliver/fec-gov/')
      expect(@utility_class.match).to be_nil
    end

    it 'matches with parent if it is an exact match' do
      @utility_class.crawl_pages(@nav_item_project_with_children, '/what-we-deliver/')
      expect(@utility_class.match).to match @nav_item_project_with_children
    end

    it 'matches with the child if it is an exact match' do
      @utility_class.crawl_pages(@nav_item_project_with_children, '/what-we-deliver/fec-gov/')
      expect(@utility_class.match).to match @nav_item_project_child
    end
  end

  describe '#find_page' do
    it 'finds a top level page: /blog/' do
      actual = @utility_class.find_page('/blog/', @nav_items)
      expect(actual).to match @nav_item_blog
    end

    it 'finds a top level page: /join/' do
      actual = @utility_class.find_page('/join/', @nav_items)
      expect(actual).to match @nav_item_join
    end

    it 'finds a child level page' do
      actual = @utility_class.find_page('/join/leave-policies/', @nav_items)
      expect(actual).to match @nav_item_join['children'].last
    end

    it 'finds a grandchild level page' do
      actual = @utility_class.find_page('/join/interview-process/child-1/', @nav_items)
      expect(actual).to match @nav_item_join['children'][4]['children'][0]
    end
  end

  describe '#in_groups' do
    it 'divides an array into a set of arrays' do
      actual = @utility_class.in_groups([1, 2, 3], 3)
      expect(actual).to match [[1], [2], [3]]
      actual = @utility_class.in_groups([1, 2, 3, 4], 2)
      expect(actual).to match [[1, 2], [3, 4]]
    end

    it 'divides an array, with the remainder going to the remaining arrays evenly' do
      actual = @utility_class.in_groups([1, 2, 3, 4, 5], 3)
      expect(actual).to match [[1, 2], [3, 4], [5]]
    end

    it 'divides an array into a set of arrays; Works with all types' do
      actual = @utility_class.in_groups([1, 'two', nil, [3, 4], 5.6], 3)
      expect(actual).to match [[1, 'two'], [nil, [3, 4]], [5.6]]
    end
  end

  describe '#weighted_sort' do
    it 'orders an array of objects by the attributes defined' do
      actual = @utility_class.weighted_sort(@projects, 'weight', 'title')
      expected = [
        { 'title' => 'Heavy project', 'weight' => 10 },
        { 'title' => 'Cool project', 'weight' => 2 },
        { 'title' => 'Some project', 'weight' => 1, 'alt_weight' => 2 },
        { 'title' => 'Alphabetically first project', 'alt_weight' => 2 },
        { 'title' => 'Ze alphabetically last project' }
      ]
      expect(actual).to match expected
    end

    it 'orders an array of objects by the attributes defined' do
      actual = @utility_class.weighted_sort(@projects, 'alt_weight', 'title')
      expected = [
        { 'title' => 'Alphabetically first project', 'alt_weight' => 2 },
        { 'title' => 'Some project', 'weight' => 1, 'alt_weight' => 2 },
        { 'title' => 'Cool project', 'weight' => 2 },
        { 'title' => 'Heavy project', 'weight' => 10 },
        { 'title' => 'Ze alphabetically last project' }
      ]
      expect(actual).to match expected
    end
  end
end
