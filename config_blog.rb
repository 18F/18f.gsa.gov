require 'pry'
require 'rb-readline'
# script to update the blog build config
posts = './_posts'
post_directory = Dir[File.join(posts, '**', '*')]
post_count = post_directory.count { |file| File.file?(file) }
stripped_post_directory = post_directory.map do |post|
  post.slice(2, post.size)
end

config_path = './_config-blog.yml'
lines = File.readlines(config_path)
acceptable_indices = [
  stripped_post_directory.count - 1,
  stripped_post_directory.count - 2,
  stripped_post_directory.count - 3 ]


stripped_post_directory.each_with_index do |post, index|
  if !lines.include? "- #{post}\n" and !acceptable_indices.include? index
      lines << "- #{post}"
  end
end

File.open(config_path, 'w') do |f|
  f.puts lines
end
