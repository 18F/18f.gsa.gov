require 'pry'
require 'yaml'

class FrontmatterTests < Jekyll::Command
  class << self
    # Public: checks a hash for expected keys
    #
    # target - the hash under test
    # keys - an array of keys the data is expected to have, usually loaded from
    #        a schema file by loadschema()
    # title - A string representing `data`'s name
    def check_keys(target, keys, title)
      keys -= ['config']
      unless target.respond_to?('keys')
        puts "The file #{title} is missing all frontmatter.".red
        return false
      end
      diff = keys - target.keys
      if diff.empty?
        return true
      else
        puts "\nThe file #{title} is missing the following keys:".red
        for k in diff
          puts "    * #{k}".red
        end
        return false
      end
    end

    def basepath
      File.join(Dir.pwd, 'tests', 'schema')
    end

    # Internal: eventually, validate that the *values* match expected types
    #
    # For example, if we expect the `date` key to be in yyyy-mm-dd format, validate
    # that it's been entered in that format. If we expect authors to be an array,
    # make sure we're getting an array.
    def check_types(data, schema, file)
      return false unless data.respond_to?('keys')
      schema.each do |s|
        key = s[0]
        value = s[1]
        type = if value.class == Hash
                 value['type']
               else
                 value
               end

        next unless required?(key, schema)
        if key == 'config'
          next
        elsif value.class == Hash
          next unless value.keys.include?('one_of') || value.keys.include?('rules')
          violate_one_of = check_one_of(data, key, value) == false
          violate_rules = check_rules(data, key, value) == false
          return false if violate_one_of || violate_rules

        elsif type == 'Array' && data[key].class == Array
          next
        elsif type == 'Boolean' && data[key].is_a?(Boolean)
          next
        elsif type == 'String' && data[key].class == String
          next
        elsif type == 'Date'
          next
        else
          puts "    * invalid value for '#{key}' in #{file}. " \
               "Expected #{type} but was #{data[key].class}\n\n"
          return false
        end
      end
    end

    def check_one_of(data, key, value)
      if value.keys.include?('one_of') && !one_of?(data[key], value['one_of'])
        puts "    * One of error: One of '#{data[key]}' was not".red
        puts "                    in the list of expected values in".red
        puts "                    #{File.join(basepath, value['one_of'])}\n".yellow

        false
      end
    end

    def check_rules(data, key, value)
      if value.keys.include?('rules') && !follows_rules?(data[key], value['rules'])
        puts "    * Rules error: One of '#{data[key]}'".red
        puts "                   doesn't follow the rules defined in".red
        puts "                   #{basepath}/rules.yml\n".yellow
        false
      end
    end
  end
end
