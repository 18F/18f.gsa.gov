require 'yaml'
def config
	@config ||= YAML.load_file '_config.yml'
end

def loadschema(file)
	YAML.load_file(File.join("deploy", "tests", "schema", file))
end

def process(schema)
	puts 'processing files'
	dir = File.join(schema['config']['path'])
	passfail = nil
	Dir.open(dir).each do |f|
		file = File.open(File.join(dir, f))
		unless schema['config']['ignore'].include?(f)
			data = YAML.load_file(file)
			passfail = check_keys(data, schema.keys, f)
		end
	end
	if passfail
		return true
	else
		return false
	end
end

def check_keys(data, keys, title)
	keys = keys - ['config']
	unless data.respond_to?('keys')
		puts "The file #{title} is missing all frontmatter."
		return false
	end
	if data.keys.sort == keys.sort
		return true
	else
		diff = keys - data.keys
		puts "The file #{title} is missing the following keys:"
		for k in diff
			puts "    * #{k}\n"
		end
		puts "\n"
		return false
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
			data[key].class == type
		end
	end
	return true
end

puts 'starting tests'
puts 'testing posts'
test = Array.new
test.push process(loadschema('_posts.yml'))
test.push process(loadschema('_team.yml'))
unless test.include?(false)
	puts 'Tests finished!'
	exit 0
else
	puts "The test exited with errors, see above."
	exit 1
end
