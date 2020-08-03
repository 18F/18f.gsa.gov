require_relative './assets'
require_relative './browserify'
require_relative './config'
require_relative './search_page'
require_relative './search_page_layouts'

require 'jekyll'

module JekyllPagesApiSearch
  class Generator < ::Jekyll::Generator
    def generate(site)
      return if Config.skip_index?(site)
      JekyllPagesApiSearch::SearchPageLayouts.register(site)
      site.pages << JekyllPagesApiSearch::SearchPage.new(site)
      JekyllPagesApiSearch::Assets.copy_to_site(site)
    end
  end
end
