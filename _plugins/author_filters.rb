require_relative '../lib/author'
require_relative '../lib/photo'

module Jekyll
  module AuthorLinkFilter
    # Given an author slug (e.g. "matt-cloyd"),
    # returns a link to the author's page if they've published anything,
    # otherwise just returns their name
    def team_link(slug)
      author = Author.find_by!(slug: slug)
      author.link_tag
    end
  end

  module TeamMemberPhotoFilter
    # Given a slug, returns the photo of the team member or a placeholder
    def team_photo(slug)
      author = Author.find_by(slug: slug)
      return author.photo_tag if author
      Photo.new(slug: slug, config: Jekyll.sites[0].config).tag
    end
  end
end

Liquid::Template.register_filter(Jekyll::AuthorLinkFilter)
Liquid::Template.register_filter(Jekyll::TeamMemberPhotoFilter)
