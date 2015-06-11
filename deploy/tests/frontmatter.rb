require 'yaml'
def loadconfig()
	config = YAML.load_file('_config.yml')
end
@config = loadconfig

def loadschema(file)
	YAML.load_file(File.join("deploy", "tests", "schema", file))
end

def process(schema)
	puts 'processing files'
	dir = File.join(schema['config']['path'])
	Dir.open(dir).each do |f|
		file = File.open(File.join(dir, f))
		unless schema['config']['ignore'].include?(File.basename(file))
			data = YAML.load_file(file)
			keys = check_keys(data, schema.keys, file)
		end
	end
	if defined?(keys = true) and defined?(types = true) and defined?(rules = true)
		return true
	else
		puts "The test exited with errors, see above."
	end
end

def check_keys(data, keys, file)
	keys = keys - ['config']
	if data.keys == keys
		return true
	else
		diff = keys - data.keys
		unless diff_optional(diff)
			puts "In post #{File.basename(file)}, the following key(s) \nis (are) missing from the front-matter:"
			for d in diff
				puts "    #{d}\n"
			end
			puts "If you think this is an error, go back and check spelling\nand capitalization on front-matter entries.\n\n"
			return false
		end
	end
end

# Works in progress: eventually, validate that the *values* match expected types
#
# For example, if we expect the `date` key to be in yyyy-mm-dd format, validate
# that it's been entered in that format. If we expect authors to be an array, 
# make sure we're getting an array.
def check_types(data, schema, file)
	for s in schema
		key  = s[0]
		type = s[1]
		if data.has_key?(key)
			require 'pry'; binding.pry
			return data[key].class == type
		end
	end
end

def check_rules(data, schema, file)
	YAML.load_file('deploy/tests/schema/rules.yml')
end
puts 'starting tests'
post_schema = loadschema('_posts.yml')
test = process(post_schema)
if test
	puts 'Tests finished!'
	exit 0
else
	exit 1
end
