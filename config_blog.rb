require 'pry'
require 'rb-readline'
# script to update the blog build config
posts = './_posts'
post_directory = Dir[File.join(posts, '**', '*')]
stripped_post_directory = post_directory.map do |post|
  post.slice(2, post.size)
end

post_count = stripped_post_directory.count
config_path = './_config-blog.yml'
lines = File.readlines(config_path)
acceptable_indices = [
  post_count - 1,
  post_count - 2,
  post_count - 3
]

stripped_post_directory.each_with_index do |post, index|
  if !lines.include? "- #{post}\n" and !acceptable_indices.include? index
    lines << "- #{post}"
  end
end

File.open(config_path, 'w') do |f|
  f.puts lines
end
