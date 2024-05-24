require "yaml"
require "jekyll"
require_relative "collection"
require_relative "photo"
require_relative "post"

# This Author collection class manages author data, and
# powers the staff_link and staff_photo filters.
class Author < Collection
  attr_reader :data, :file

  def initialize(slug)
    @file = File.join(self.class.files_dir, "#{slug}.md")
    load_data
  end

  # @return [String] The author's full name
  def full_name
    @data.fetch("full_name")
  end

  # @return [String] The author's slug, aka the `name` property in the file.
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

  def update_published!(list: Post.author_slugs)
    return false if data.fetch("published") == published?(list: list)
    warn_about_unpublishing if data["published"]
    @data["published"] = !@data["published"]
    File.write(file, @data.to_yaml)
    load_data
  end

  # @return [Array<Author>] All authors
  def self.all
    all_slugs.map { |slug| new(slug) }
  end

  # Gets author slugs (e.g. "matt-cloyd") from all the files in the authors collection (e.g. "_authors")
  # Used to determine who has published a blog post
  # @return [Array<String>]
  def self.all_slugs
    @all_slugs ||= files.map { |path| ensure_matching_slug(path) }
  end

  # Ensures that the slug in the author file path (e.g. "_authors/matt-cloyd.md") matches
  #   the author `name` property inside the file. Mismatched slugs could cause problems.
  # @return [String] The matching slug
  class << self
    def ensure_matching_slug(path)
      path_slug = File.basename(path, File.extname(path))
      file_slug = YAML.load_file(path).fetch("name")
      return path_slug if path_slug == file_slug
      raise <<~ERR
        Author slug in file `#{path}` does not match the `name` property inside, "#{file_slug}".
        Please change either the file path or the `name` property to make them match.
      ERR
    end
  end

  private

  def warn_about_unpublishing
    warn "Author #{full_name} was formerly published, updating to un-published. This shouldn't be a normal occurrence."
  end

  def load_data
    @data = YAML.load_file(file)
  end
end
