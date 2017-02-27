# script to update the blog build config
require 'yaml'

posts = './_posts'
post_directory = Dir[File.join(posts, '**', '*')]
stripped_post_directory = post_directory.map do |post|
  post.slice(2, post.size)
end

post_count = stripped_post_directory.count
config_paths = ['./_config-blog.yml', './_config-accesslint.yml']
config_paths.each do |config|
  frontmatter = YAML.load_file(config)
  # Delete all '_posts/'
  frontmatter['exclude'].delete_if { |x| x.include?('_posts/') }
  # Add all posts back to exclude
  stripped_post_directory.each do |post|
    frontmatter['exclude'] << post
  end

  # Remove the last two posts
  frontmatter['exclude'] = frontmatter['exclude'][0...-2]

  frontmatter_new = YAML.dump(frontmatter) << "---\n\n"
  File.write(config, frontmatter_new)
end
