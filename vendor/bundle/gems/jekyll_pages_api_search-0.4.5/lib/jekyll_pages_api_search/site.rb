# @author Mike Bland (michael.bland@gsa.gov)

require 'jekyll_pages_api'
require 'safe_yaml'

module JekyllPagesApiSearch
  class Site
    attr_reader :source, :config
    attr_accessor :pages

    def initialize(basedir, config)
      @source = basedir
      @config = SafeYAML.load_file(config, :safe => true)
      @pages = []
    end

    # TODO(mbland): comment on how a pages.json file can be transfered from
    # JekyllPagesApi::GeneratedSite
    def load_pages_json(pages_json_path)
      basename = File.basename pages_json_path
      rel_dir = File.dirname pages_json_path
      rel_dir = rel_dir[self.source.size..rel_dir.size]
      page = ::JekyllPagesApi::PageWithoutAFile.new(
        self, self.source, rel_dir, basename)
      page.output = File.read(pages_json_path)
      self.pages << page
    end
  end
end
