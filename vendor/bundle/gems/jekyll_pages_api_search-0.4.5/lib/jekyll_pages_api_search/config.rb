module JekyllPagesApiSearch
  class Config
    def self.get(site, value)
      search_config = site.config['jekyll_pages_api_search']
      search_config[value] unless search_config.nil?
    end

    def self.skip_index?(site)
      search_config = site.config['jekyll_pages_api_search']
      return true if search_config.nil?
      skip_index_value = search_config['skip_index']
      return skip_index_value unless skip_index_value.nil?
      search_config['skip_index'] = !node_installed?
    end

    def self.node_installed?
      $stdout.write('jekyll_pages_api_search: checking for Node.js: ')
      return true if system('node', '-v')
      puts('not generating search index because Node.js not found; check ' \
        'your PATH environment variable or visit https://nodejs.org/ ' \
        'to download Node.js for your system')
      false
    end
  end
end
