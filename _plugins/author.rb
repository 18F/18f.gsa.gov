module Jekyll
  class AuthorTag < Liquid::Tag
    def initialize(tag_name, author, tokens)
      super
      @author = author.strip
    end

    def render(context)
      teammate = context.registers[:site].data['team'][@author]
      if teammate.nil?
        teammate = context.registers[:site].data['pif_team'][@author]
      end
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
      name = input[0]
      info = input[1]
      image = File.join 'assets', 'images', 'team', "#{name}.jpg"
      if File.exist?(File.join(Jekyll.sites[0].config['source'], image))
        "<div class='bio'>\n
          <a href='/team/#{name}'><img class='img-circle team-img bio-clip' src='/#{image}' alt='18F team member #{info['full_name']}'>\n
          <h1>#{info['full_name']}</h1></a>\n
        </div>"
      end
    end
  end
end

Liquid::Template.register_tag('author', Jekyll::AuthorTag)
Liquid::Template.register_filter(Jekyll::AuthorFilter)