module Jekyll
  class AuthorTag < Liquid::Tag
    def initialize(tag_name, author, tokens)
      super
      @author = author.strip
    end

    def render(context)
      team = context.registers[:site].data['team']
      teammate = team.find {|t| t['name'] == @author}

      if teammate
        "<span class=\"author #{teammate['name']}\">" +
          "<img src=\"/assets/images/team/#{teammate['name']}.jpg\" />" +
          "#{teammate['full_name']}" +
        "</span>"
      else
        raise Exception.new("No teammate found by that name: #{@author}")
      end
    end
  end
end

Liquid::Template.register_tag('author', Jekyll::AuthorTag)
