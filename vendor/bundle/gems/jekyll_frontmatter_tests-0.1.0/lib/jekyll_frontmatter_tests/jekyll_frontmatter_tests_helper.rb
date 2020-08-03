require 'pry'
require 'yaml'

class FrontmatterTests < Jekyll::Command
  class << self
    def one_of?(data, schema)
      if schema.instance_of?(Array) && data.instance_of?(Array)
        (schema & data).count == data.count
      elsif schema.include? '.yml'
        schema_list = YAML.load_file(File.join(Dir.pwd, 'tests', 'schema', schema))
        (schema_list & data).count == data.count
      elsif schema.instance_of?(String) && data.instance_of?(Array)
        false
      else
        schema == data
      end
    end

    def follows_rules?(value, rules)
      if rules.include?('no-dash') && rules.include?('lowercase')
        FrontmatterRules.dashless?(value) && FrontmatterRules.lowercase?(value)
      elsif rules.include?('no-dash') && !rules.include?('lowercase')
        FrontmatterRules.dashless?(value)
      elsif !rules.include?('no-dash') && rules.include?('lowercase')
        FrontmatterRules.lowercase?(value)
      end
    end

    def required?(key, schema)
      is_required = true
      is_primary = schema[key]
      schema['config'] = schema['config'] || { 'optional': [] }
      is_optional = schema['config']['optional'].include?(key)

      if is_primary && !is_optional
        is_required
      elsif (is_primary && is_optional) || (!is_primary && is_optional)
        !is_required
      else
        raise 'The key provided is not in the schema.'
      end
    end
  end
end
