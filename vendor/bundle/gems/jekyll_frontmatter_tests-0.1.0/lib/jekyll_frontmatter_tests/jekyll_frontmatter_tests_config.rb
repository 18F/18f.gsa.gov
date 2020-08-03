require 'jekyll'

class FrontmatterTests < Jekyll::Command
  class << self
    def schema_config
      config = Jekyll.configuration
      unless config.key?('frontmatter_tests')
        config['frontmatter_tests'] = { 'path' => File.join('deploy', 'tests', 'schema') }
      end
      config['frontmatter_tests']
    end
  end
end
