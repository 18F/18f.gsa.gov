require 'pry'
require 'yaml'
require 'jekyll'

class FrontmatterTests < Jekyll::Command
  class << self
    # Internal: fired when `jekyll test` is run.
    #
    # When `jekyll test` runs, `test_frontmatter` is fired with options and args
    # passed from the command line.
    def init_with_program(prog)
      prog.command(:test) do |c|
        c.syntax 'test [options]'
        c.description 'Test your site for frontmatter.'

        c.option 'posts', '-p', 'Target only posts'
        c.option 'collections', '-c [COLLECTION]', 'Target a specific collection'
        c.option 'all', '-a', 'Test all collections (Default)'

        c.action do |args, options|
          options = { 'all' => true } if options.empty?
          test_frontmatter(args, options)
        end
      end
    end
  end
end
