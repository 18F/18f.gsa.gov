require 'jekyll'

module JekyllPagesApiSearch
  class SearchPage < ::Jekyll::Page
    DEFAULT_TITLE = 'Search results'
    DEFAULT_ENDPOINT = 'search'

    def initialize(site)
      @site = site
      @name = 'index.html'

      process(@name)
      @data = {}
      search_config = site.config['jekyll_pages_api_search']
      data['title'] = search_config['results_page_title'] || DEFAULT_TITLE
      data['permalink'] = endpoint(site.config, search_config)
      data['layout'] = (
        search_config['layout'] || SearchPageLayouts::DEFAULT_LAYOUT)
      data['skip_index'] = true
    end

    private

    def endpoint(site_config, search_config)
      "/#{search_config['endpoint'] || DEFAULT_ENDPOINT}/".gsub(/\/+/, '/')
    end
  end
end
