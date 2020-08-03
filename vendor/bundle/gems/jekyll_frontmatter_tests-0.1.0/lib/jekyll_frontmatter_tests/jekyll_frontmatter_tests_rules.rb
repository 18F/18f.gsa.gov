require 'pry'
require 'yaml'

class FrontmatterRules
  class << self
    # Returns true if there are no dashes in any of the values
    def dashless?(values)
      rules_config = RulesConfig.new
      rules = rules_config.rules['no-dash'] || rules_config.empty_rule
      exceptions = rules['exceptions'].compact
      if values.instance_of?(Array)
        no_dashes = values.map do |value|
          (!value.include?('-') && !value.include?('–')) || exceptions.include?(value)
        end
        # no_dashes will only have false values if there are dashes present
        !no_dashes.include? false
      elsif values.instance_of?(String)
        (!values.include?('-') && !values.include?('–')) || exceptions.include?(values)
      end
    end

    # Returns true if there are no uppercase characters in any of the values
    def lowercase?(values)
      rules_config = RulesConfig.new
      rules = rules_config.rules['lowercase'] || rules_config.empty_rule
      exceptions = rules['exceptions'].compact
      if values.instance_of?(Array)
        all_lowercase = values.map do |value|
          (value.downcase == value) || exceptions.include?(value)
        end
        # all_lowercase will only have false values if there are are uppercase
        # characters present
        !all_lowercase.include? false
      elsif values.instance_of?(String)
        (values.downcase === values) || exceptions.include?(values)
      end
    end
  end
end

class RulesConfig
  def initialize
    rules_yml = File.join(Dir.pwd, 'tests', 'schema', 'rules.yml')
    gem_path = $LOAD_PATH.select { |p| p.include? 'jekyll_frontmatter_tests' }
    default_rules_yml = File.join(gem_path, 'rules.yml')
    rules_config = File.exists?(rules_yml) ? rules_yml : default_rules_yml
    @rules = YAML.load_file(rules_config)
    @empty_rule = { "exceptions"=>[] }
  end

  attr_reader :rules, :empty_rule
end
