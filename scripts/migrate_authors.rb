require 'set'
f = File.open('../_data/authors.yml')
yml_authors  = Set.new()
new_authors  = Set.new()

f.each do |line|
  line = line.strip
  if(line[0]!= '#')
     if(line[-1]== ':')
       name = line[0..-2]
       yml_authors.add(name)
     end
  end
end

Dir.foreach(File.expand_path('../_authors','../_data')) do |file|
  if file.to_s != '.' && file.to_s != '..'
    name = file.slice(0...-3)
    new_authors.add(name)  
  end
end

# find the difference of the 2 sets 
remaining_authors = yml_authors - new_authors
author = remaining_authors.collect{ |e| e}
puts author

