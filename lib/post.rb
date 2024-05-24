require "date"
require "yaml"

# This Post collection class is primarily used for collecting
# author slugs from posts, so that Author#published? can
# determine whether the author has written any blog posts.
class Post < Collection
  # @return [Array<String>] Unique list of all author slugs across all posts
  def self.author_slugs
    @author_slugs ||= files.map do |path|
      YAML.load_file(path, permitted_classes: [Date, Time]).fetch("authors")
    end.flatten.uniq.sort
  end
end
