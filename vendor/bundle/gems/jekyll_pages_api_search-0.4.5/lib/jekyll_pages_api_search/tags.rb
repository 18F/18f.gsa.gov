# @author Mike Bland (michael.bland@gsa.gov)

require_relative './config'
require 'liquid'

module JekyllPagesApiSearch
  class SearchInterfaceTag < Liquid::Tag
    NAME = 'jekyll_pages_api_search_interface'
    Liquid::Template.register_tag(NAME, self)
    CODE = File.read(File.join(File.dirname(__FILE__), 'search.html'))
    TEMPLATE = Liquid::Template.parse(CODE)

    def render(context)
      site = context.registers[:site]
      placeholder = Config.get(site, 'placeholder') ||
        'Search - click or press \'/\''
      baseurl = site.config['baseurl'] || ''
      search_endpoint = site.config['search_endpoint'] || 'search/'
      search_endpoint = "/#{baseurl}/#{search_endpoint}/".gsub('//', '/')
      TEMPLATE.render('search_endpoint' => search_endpoint,
        'placeholder' => placeholder)
    end
  end

  class LoadSearchTag < Liquid::Tag
    NAME = 'jekyll_pages_api_search_load'
    Liquid::Template.register_tag(NAME, self)

    def render(context)
      return @code if @code
      site = context.registers[:site]
      baseurl = site.config['baseurl']
      @code = LoadSearchTag.generate_script(baseurl, site: site)
    end

    def self.generate_script(baseurl, site: nil)
      "<script>JEKYLL_PAGES_API_SEARCH_BASEURL = '#{baseurl}';</script>\n" +
        site_bundle_load_tag(site, baseurl) +
        "<script async src=\"#{baseurl}/assets/js/search-bundle.js\">" +
        "</script>"
    end

    def self.site_bundle_load_tag(site, baseurl)
      browserify_config = site.nil? ? nil : Config.get(site, 'browserify')
      return '' if browserify_config.nil?
      "<script src=\"#{baseurl}/#{browserify_config['target']}\"></script>\n"
    end
  end

  class SearchResultsTag < Liquid::Tag
    NAME = 'jekyll_pages_api_search_results'
    Liquid::Template.register_tag(NAME, self)

    def render(context)
      '<ol id=\'search-results\'></ol>'
    end
  end
end
