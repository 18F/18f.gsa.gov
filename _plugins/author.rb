module Jekyll
  class AuthorTag < Liquid::Tag
    def initialize(tag_name, author, tokens)
      super
      @author = author.strip
    end

    def render(context)
      teammate = finder('team', @author)
      if teammate.nil?
        teammate = finder('pif_team', @author)
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

    def finder(group, name)
        return Jekyll.sites[0].data[group].find {|member| member["name"] == name}
    end
  end

  class AuthoredPosts < Liquid::Tag
    def initialize(tag_name, heading, tokens)
      super
      @heading = heading.split('=')[1].strip
    end

    def render(context)
      authored = []
      author = context.environments[0]['page']['name']
      full_name = context.environments[0]['page']['full_name']
      first_name = context.environments[0]['page']['first_name']
      posts = context.environments[0]['site']['posts']
      site_url = context.environments[0]['site']['url']
      for p in posts
        if p.data['authors'] and p.data['authors'].include? author
          authored.push(p)
        end
      end
      unless authored.empty?
        list = "<#{@heading}>#{first_name}'s blog posts:</#{@heading}>"
        list << "<ul>"
        for a in authored
          list << "<li><a href='#{site_url}/#{a.url}'>#{a.title}</a></li>"
        end
        list << "</ul>"
      end
    end
  end

  module AuthorFilter
    def with_pic(input)
      name = input[0]
      info = input[1]
      image = File.join 'assets', 'images', 'team', "#{name}.jpg"
      if File.exist?(File.join(Jekyll.sites[0].config['source'], image))
        "<img class='img-circle team-img bio-clip' src='/#{image}' alt='18F team member #{info['full_name']}'>"
      else
        "<img class='img-circle team-img bio-clip' src='/assets/images/18f.png' alt='18F logo'>"
      end
    end
    # lookup filter
    #
    # A liquid filter that takes an author slug as "input" and extracts from the
    # data set in the first arg the value of the key in the second arg for "input"
    #
    # Example:
    # if we have a variable `author` set to "boone" the following syntax:
    # ```
    # {{author | lookup:"authors, full_name"}}
    # ```
    # Will look for an entry in the authors data file named "boone" and exact
    # the value assocated with "full_name."
    #
    # Returns a string containing the requested value
    def lookup(input, args)
      args = args.split(',')  # turns the comma separated args string into an array
      dataset = args[0].strip # strips whitespace for the requested data file
      key = args[1].strip     # strips whitespace for the requested key
      data = Jekyll.sites[0].data[dataset] # returns the full data file
      if data[input]          # if there's an entry for author, return the value
        data[input][key]
      else                    # if not, exit with a "no such author error"
        puts "No such author: #{input}"
        exit 1
      end
    end
  end
end

Liquid::Template.register_tag('author', Jekyll::AuthorTag)
Liquid::Template.register_tag('authored_posts', Jekyll::AuthoredPosts)
Liquid::Template.register_filter(Jekyll::AuthorFilter)
