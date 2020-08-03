require 'pry'
require 'yaml'

class FrontmatterTests < Jekyll::Command
  class << self
    # Public: Processes options passed throguh the command line, runs
    # the appropriate tests.
    #
    # args - command line arguments (example: jekyll test [ARG])
    # options - command line options (example: jekyll test -[option] [value])
    #
    # Depending on the flag passed (see `init_with_program`), runs the expected # test.
    #
    # Example: the following comamnd `jekyll test -p` will pass ``{'posts' =>
    #          true}` as `options`. This will cause `test_frontmatter` to
    #          compare all docs in _posts with the provided schema.
    #
    # The test runner pushes the result of each test into a `results` array and # exits `1` if any tests fail or `0` if all is well.
    def test_frontmatter(_args, options)
      puts 'starting tests'
      if options['posts']
        results = test_posts
      elsif options['collections']
        collections = options['collections'].split(',')
        results = test_collections(collections)
      else
        results = test_everything
      end
      if results.find_index { |r| r == false }
        puts 'The test exited with errors, see above.'
        exit 1
      else
        puts 'Tests finished!'
        exit 0
      end
    end

    # Public: tests all documents that are "posts"
    #
    # Loads a schema called _posts.yml and processes all post documents against
    # it.
    def test_posts
      puts 'testing posts'.green
      yepnope = [].push process(load_schema('_posts.yml'))
      puts 'Finished testing'.green
      yepnope
    end

    # Public: Tests only specific collection documents
    #
    # collections - a comma separated string of collection names.
    #
    # `collections` is split into an array and each document is loaded and
    # processed against its respective schema.
    def test_collections(collections)
      yepnope = []
      for c in collections
        puts "Testing #{c}".green
        yepnope.push process(load_schema("_#{c}.yml"))
        puts "Finished testing #{c}".green
      end
      yepnope
    end

    # Public: Tests all collections described by a schema file at
    # `deploy/tests/schema`
    def test_everything
      schema = Dir.open(schema_config['path'])
      yepnope = []
      schema.each do |s|
        next unless s.start_with?('_')
        puts "Testing #{s}".green
        yepnope.push process(load_schema(s))
        puts "Finished testing #{s}".green
      end
      yepnope
    end
  end
end
