require 'yaml'
require 'jekyll'
require_relative './collection'
require_relative './photo'
require_relative './post'


class Author < Collection

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

  # @smell This collaborator (Photo) is hard-coded, leading to coupled tests
  def photo_tag(config: Jekyll.sites[0].config)
    Photo.new(slug: slug, config: config).tag
  end

  def path(config: Jekyll.sites[0].config)
    "#{config.fetch("baseurl")}/author/#{slug}"
  end

  def link_tag(config: Jekyll.sites[0].config)
    if published?
      "<a class='post-author' itemprop='name' href='#{path}'>#{full_name}</a>"
    else
      full_name
    end
  end

  def published?(list: Post.author_slugs)
    list.include?(slug)
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
