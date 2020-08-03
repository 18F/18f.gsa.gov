# @author Mike Bland (michael.bland@gsa.gov)

require 'jekyll_pages_api'
require 'json'

module JekyllPagesApiSearch
  class SearchIndexBuilder
    DIRNAME = File.dirname(__FILE__).freeze
    COMPILE_SCRIPT = File.join(DIRNAME, 'search.js').freeze
    INDEX_FILE = 'search-index.json'.freeze

    def self.build_index(site)
      corpus_page = find_corpus_page(site.pages)
      raise 'Pages API corpus not found' if corpus_page == nil

      search_config = site.config['jekyll_pages_api_search']
      index_fields = JSON.generate(search_config['index_fields'] || {})
      input = "{\"corpus\": #{corpus_page.output}," \
        "\"indexFields\": #{index_fields}}"
      compile(input,
        JekyllPagesApi::PageWithoutAFile.new(site, site.source, '', INDEX_FILE))
    end

    def self.find_corpus_page(pages)
      pages.each {|page| return page if page.name == 'pages.json'}
    end

    def self.compile(input, index_page)
      compiler = open("|node #{COMPILE_SCRIPT}", File::RDWR)
      compiler.puts(input)
      compiler.close_write
      index_page.output = compiler.gets
      index_page
    end
  end
end
