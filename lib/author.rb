require 'yaml'
require 'jekyll'
require_relative './photo'
require_relative './post'

module Jekyll
  class Author

    DEFAULT_DIR = "_authors"

    attr_reader :data

    def initialize(slug)
      @data = YAML.load_file(File.join(self.class.files_dir, "#{slug}.md"))
    end

    def full_name
      @data.fetch("full_name")
    end

    def slug
      @data.fetch("name")
    end

    def path(config: Jekyll.sites[0].config)
      "#{config.fetch("baseurl")}/author/#{slug}"
    end

    # @smell This collaborator is hard-coupled, leading to coupled tests
    def photo_tag(config: Jekyll.sites[0].config)
      Photo.new(slug: slug, config: config).tag
    end

    def published?(list: Post.author_slugs)
      list.include?(slug)
    end

    def self.find_by(slug: )
      return nil unless all_slugs.detect { |file_slug| file_slug == slug }
      new(slug)
    end

    def self.find_by!(slug: )
      maybe_record = find_by(slug: slug)
      if maybe_record.nil?
        raise RuntimeError, "No #{self.name} record found for \"#{slug}\""
      end
      maybe_record
    end

    # @todo There's likely a simpler way to get this via something like
    #   `Jekyll.sites[0].collections["authors"]` -- however, I'm not able
    #   to see that in the console.
    def self.files_dir=(dir)
      @@files_dir = dir
    end

    def self.files_dir
      @@files_dir ||= DEFAULT_DIR
    end

    def self.files(ext: "*.md")
      Dir.glob(File.join(self.files_dir, ext))
    end

    def self.all
      all_slugs.map { |slug| new(slug) }
    end

    # Gets author slugs (e.g. "matt-cloyd") from all the files in the authors collection (e.g. "_authors")
    # Used to determine who has published a blog post
    def self.all_slugs
      @all_slugs ||= self.files.map { |path| ensure_matching_slug(path) }
    end

    private

    # Ensures that the slug in the author file path (e.g. "_authors/matt-cloyd.md") matches
    #   the author `name` property inside the file. Mismatched slugs could cause problems.
    def self.ensure_matching_slug(path)
      path_slug = File.basename(path, File.extname(path))
      file_slug = YAML.load_file(path).fetch("name")
      return path_slug if path_slug == file_slug
      raise RuntimeError, <<~ERR
        Author slug in file `#{path}` does not match the `name` property inside, \"#{file_slug}\".
        Please change either the file path or the `name` property to make them match.
      ERR
    end
  end
end
