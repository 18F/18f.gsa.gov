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
			passfail = check_types(data, schema)
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
	diff = keys - data.keys
	if diff == []
		return true
	else
		puts "The file #{title} is missing the following keys:"
		for k in diff
			puts "    * #{k}\n"
		end
		return false
	end
end

# Works in progress: eventually, validate that the *values* match expected types
#
# For example, if we expect the `date` key to be in yyyy-mm-dd format, validate
# that it's been entered in that format. If we expect authors to be an array,
# make sure we're getting an array.
def check_types(data, schema)
	unless data.respond_to?('keys')
		return false
	end
	for s in schema
		key  = s[0]
		if s[1].class == Hash
			type = s[1]['type']
		else
			type = s[1]
		end

		if type == "Array" and data[key].class == Array
			return true
		elsif type == "String" and data[key].class == String
			return true
		elsif type == "Date" and data[key].class == String
			return true
		else
			puts "    * Data is of the wrong type for key #{key}, expected #{type} but was #{data[key].class}\n\n"
			return false
		end
	end
end

puts 'starting tests'
puts 'testing posts'
test = Array.new
test.push process(loadschema('_posts.yml'))
test.push process(loadschema('_team.yml'))
test.keep_if { |t| t == false }
if test[0]
	puts 'Tests finished!'
	exit 0
else
	puts "The test exited with errors, see above."
	exit 1
end
