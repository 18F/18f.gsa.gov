require_relative './config'

require 'English'
require 'jekyll/static_file'
require 'jekyll_pages_api'

module JekyllPagesApiSearch
  class Browserify
    DIRNAME = File.dirname(__FILE__).freeze
    BROWSERIFY_SCRIPT = File.join(DIRNAME, 'browserify.js').freeze

    def self.create_bundle(site)
      browserify_config = Config.get(site, 'browserify')
      return if browserify_config.nil?
      source = File.join(site.source, browserify_config['source'])
      target = File.join(site.dest, browserify_config['target'])
      execute_browserify(source, target)
    end

    def self.execute_browserify(source, target)
      status = system("node #{BROWSERIFY_SCRIPT} #{source} #{target}")
      if $CHILD_STATUS.exitstatus.nil?
        $stderr.puts('Could not execute browserify script')
        exit 1
      end
      exit $CHILD_STATUS.exitstatus if !status
    end
  end
end
