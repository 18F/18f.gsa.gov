# @author Mike Bland (michael.bland@gsa.gov)

require_relative './compressor'
require_relative './config'
require_relative './search_page'
require_relative './search_page_layouts'

require 'jekyll/site'
require 'jekyll_pages_api'
require 'zlib'

# This Jekyl::Site override creates a hook for generating the search index
# after the jekyll_pages_api plugin has produced the api/v1/pages.json corpus.
# In the very near term, we should probably create a proper hook in the
# jekyll_pages_api plugin itself.
module Jekyll
  class Site
    alias_method :pages_api_after_render, :after_render
    alias_method :orig_write, :write

    def skip_index?
      @skip_index ||= JekyllPagesApiSearch::Config.skip_index?(self)
    end

    def after_render
      pages_api_after_render
      return if skip_index?
      self.pages << JekyllPagesApiSearch::SearchIndexBuilder.build_index(self)
    end

    def write
      orig_write
      pages_api_search_after_write unless skip_index?
    end

    def pages_api_search_after_write
      index = pages.find {|p| p.name == 'search-index.json'}
      raise 'Search index not found' if index.nil?
      JekyllPagesApiSearch::Compressor.gzip_in_memory_content(
        "#{index.destination self.dest}" => index.output)
      JekyllPagesApiSearch::Browserify.create_bundle(self)
    end
  end
end
