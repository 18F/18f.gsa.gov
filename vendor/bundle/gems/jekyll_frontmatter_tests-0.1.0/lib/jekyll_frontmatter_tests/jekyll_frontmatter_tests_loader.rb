require 'pry'
require 'yaml'

class FrontmatterTests < Jekyll::Command
  class << self
    # Public: Load a schema from file.
    #
    # file - a string containing a filename
    #
    # Used throughout to load a specific file. In the future the directories
    # where these schema files are located could be loaded from _config.yml
    #
    # Returns a hash loaded from the YAML doc or exits 1 if no schema file
    # exists.
    def load_schema(file)
      # binding.pry
      schema = File.join(Dir.pwd, schema_config['path'], file)
      # binding.pry
      if File.exist?(schema)
        YAML.load_file(schema)
      else
        puts "No schema for #{file}"
        exit 1
      end
    end
  end
end
