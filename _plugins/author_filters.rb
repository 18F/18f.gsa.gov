require_relative '../lib/author'
require_relative '../lib/photo'

module Jekyll
  # @todo Re-rename TeamFilters
  module AuthorFilters
    # Given an author slug (e.g. "matt-cloyd"), returns a link to the author's page
    def team_link(slug)
      author = Author.find_by!(slug: slug)
      href = author.path
      "<a class='post-author' itemprop='name' href='#{href}'>#{author.full_name}</a>"
    end

    # Given a slug, returns the photo of the team member or a placeholder
    def team_photo(slug)
      author = Author.find_by(slug: slug)
      return author.photo_tag if author
      Photo.new(slug: slug).tag
    end
  end
end

Liquid::Template.register_filter(Jekyll::AuthorFilters)
