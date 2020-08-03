require_relative 'page'
require_relative 'page_without_a_file'

require 'json'

module JekyllPagesApi
  class Generator
    attr_reader :site

    def initialize(site)
      @site = site
    end

    def pages
      result = []
      self.site.each_site_file do |site_file|
        page = Page.new(site_file, @site)
        result << page if page.html?
      end
      result
    end

    def pages_data
      self.pages.map(&:to_json)
    end

    def data
      {
        entries: pages_data
      }
    end

    def dest_dir
      File.join('api', 'v1')
    end

    def page
      # based on https://github.com/jekyll/jekyll-sitemap/blob/v0.7.0/lib/jekyll-sitemap.rb#L51-L54
      page = PageWithoutAFile.new(self.site, File.dirname(__FILE__), self.dest_dir, 'pages.json')
      page.output = self.data.to_json
      page
    end

    def generate
      self.site.pages << self.page
    end
  end
end
