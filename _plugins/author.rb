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
          # "<img src=\"/assets/images/team/#{teammate['name']}.jpg\" />" +
          "#{teammate['full_name']}" +
        "</span>"
      else
        raise Exception.new("No teammate found by that name: #{@author}")
      end
    end
  end

  module AuthorFilter
    def with_pic(input)
      if File.exist?("#{Jekyll.sites[0].config['source']}/assets/images/team/#{input['name']}.jpg")
        "<div class='bio'>\n
          <a><img class='img-circle team-img bio-clip' src='/assets/images/team/#{input['name']}.jpg' alt='#{input['full_name']}'>\n
          <h1>#{input['full_name']}</h1></a>\n
        </div>"
      end
    end
  end
end

Liquid::Template.register_tag('author', Jekyll::AuthorTag)
Liquid::Template.register_filter(Jekyll::AuthorFilter)
