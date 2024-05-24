require 'date'
require 'yaml'

class Post < Collection
  # Gets author slugs (e.g. "matt-cloyd") from all the published blog posts (e.g. "_posts")
  # Used to determine who has published a blog post
  def self.author_slugs
    @author_slugs ||= files.map do |path|
      YAML.load_file(path, permitted_classes: [Date, Time]).fetch("authors")
    rescue KeyError => e
      warn "File `#{path}` does not have any authors"
      raise e
    end.flatten.uniq.sort
  end
end
