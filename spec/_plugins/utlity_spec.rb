require_relative '../../_plugins/utility'
require 'pry'

RSpec.describe Jekyll::Utility do
  class UtilityClass
  end

  before(:each) do
    @utility_class = UtilityClass.new
    @utility_class.extend(Jekyll::Utility)

    @nav_item = {
      "text": "What we deliver",
      "href": "pages/what-we-deliver.md",
      "permalink": "/what-we-deliver/",
      "in_menu": true,
      "in_drawer": true,
      "in_footer": true,
      "children": nil
    }
    @baseurl = Jekyll.sites[0].config['baseurl']
    @collections = Jekyll.sites[0].collections
    @posts = @collections['posts']
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
    it 'strips forward slashes' do

      first_post = @posts.docs[0]
      f_p = @posts[0]
      binding.pry
      expect(@utility_class.matches_url('/text/', 'text')).to be true
      expect(@utility_class.matches_url('/text', 'text')).to be true
      expect(@utility_class.matches_url('text/', 'text')).to be true
    end
  end
end
