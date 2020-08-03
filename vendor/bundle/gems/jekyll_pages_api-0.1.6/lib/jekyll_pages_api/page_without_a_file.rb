require 'jekyll'

# https://github.com/jekyll/jekyll-sitemap/blob/v0.7.0/lib/jekyll-sitemap.rb#L3-L8
module JekyllPagesApi
  class PageWithoutAFile < Jekyll::Page
    def read_yaml(*)
      @data ||= {}
    end
  end
end
