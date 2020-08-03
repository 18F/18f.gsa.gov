require 'jekyll'
require 'safe_yaml'

module JekyllPagesApiSearch
  # We have to essentially recreate the ::Jekyll::Layout constructor to loosen
  # the default restriction that layouts be included in the site source.
  #
  # Copied from guides_style_18f/layouts.rb. Could probably be extracted into
  # another gem.
  class SearchPageLayouts < ::Jekyll::Layout
    DEFAULT_LAYOUT = 'search-results'
    LAYOUTS_DIR = File.join(File.dirname(__FILE__), 'layouts')

    private_class_method :new

    def initialize(site, layout_name)
      @site = site
      @base = LAYOUTS_DIR
      @name = "#{layout_name}.html"
      @path = File.join(@base, @name)
      parse_content_and_data(File.join(@base, name))
      process(name)
    end

    def parse_content_and_data(file_path)
      @data = {}
      @content = File.read(file_path)

      front_matter_pattern = /^(---\n.*)---\n/m
      front_matter_match = front_matter_pattern.match(content)
      return unless front_matter_match

      @content = front_matter_match.post_match
      @data = SafeYAML.load(front_matter_match[1], safe: true) || {}
    end
    private :parse_content_and_data

    def self.register(site)
      site.layouts[DEFAULT_LAYOUT] ||= new(site, DEFAULT_LAYOUT)
    end
  end
end
