# @author Mike Bland (michael.bland@gsa.gov)

require 'sass'

module JekyllPagesApiSearch
  class Sass
    DIR = File.join File.dirname(__FILE__), 'sass'
    INTERFACE_FILE = File.join DIR, 'jekyll_pages_api_search.scss'
  end
end

Sass.load_paths << ::JekyllPagesApiSearch::Sass::DIR
