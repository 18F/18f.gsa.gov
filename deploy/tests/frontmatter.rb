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
		unless schema['config']['ignore'].include?(File.basename(file))
			data = YAML.load_file(file)
			keys = check_keys(data, schema.keys, data['title'])
			unless keys
				passfail = keys
			end
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
	if data.keys.sort == keys.sort
		return true
	else
		diff = keys - data.keys
		puts "The file #{title} is missing the following keys:"
		for k in diff
			puts "    * #{k}\n\n"
		end
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
			require 'pry'; binding.pry
			return data[key].class == type
		end
	end
end

puts 'starting tests'
puts 'testing posts'
test = process(loadschema('_posts.yml'))
if test
	puts 'Tests finished!'
	exit 0
else
	puts "The test exited with errors, see above."
	exit 1
end
