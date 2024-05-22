require 'date'
require 'yaml'

class Post
  DEFAULT_DIR = "_posts"

  def self.files_dir=(dir)
    @@files_dir = dir
  end

  def self.files_dir
    @@files_dir ||= DEFAULT_DIR
  end

  def self.files(ext: "*.md")
    Dir.glob(File.join(self.files_dir, ext))
  end

  # Gets author slugs (e.g. "matt-cloyd") from all the published blog posts (e.g. "_posts")
  # Used to determine who has published a blog post
  def self.author_slugs
    @author_slugs ||= files.map do |path|
      YAML.load_file(path, permitted_classes: [::Date, ::Time]).fetch("authors")
    end.flatten.uniq.sort
  end
end
