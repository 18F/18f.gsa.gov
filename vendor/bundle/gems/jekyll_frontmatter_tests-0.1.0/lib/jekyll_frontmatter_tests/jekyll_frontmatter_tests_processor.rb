require 'pry'
require 'yaml'

class FrontmatterTests < Jekyll::Command
  class << self
    # Public: processes a collection against a schema
    #
    # schema - the hash-representation of a schema file
    #
    # Opens each file in the collection's expected directory and checks the
    # file's frontmatter for the expected keys and the expected format of the
    # values.
    #
    # NOTE - As it iterates through files, subdirectories will be ignored
    #
    # Returns true or false depending on the success of the check.
    def process(schema)
      dir = File.join(schema['config']['path'])
      passfail = []
      Dir.open(dir).each do |f|
        next if File.directory?(File.join(dir, f))
        file = File.open(File.join(dir, f))
        next if schema['config']['ignore'].include?(f)
        data = YAML.load_file(file)

        passfail.push check_keys(data, schema.keys, f)
        passfail.push check_types(data, schema, File.join(dir, f))
      end
      passfail.keep_if { |p| p == false }
      if passfail.empty?
        return true
      else
        puts "There were #{passfail.count} errors".red
        return false
      end
    end
  end
end
