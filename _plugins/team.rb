module Jekyll
  module TeamFilter
    # @todo Rename to `author_photo`, along with all the invocations
    def team_photo(slug)
      @author = Author.find_by(slug: slug).photo_tag
    end
  end
end

Liquid::Template.register_filter(Jekyll::TeamFilter)
