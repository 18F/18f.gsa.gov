require 'pry'
require 'rb-readline'

module Jekyll
  class AuthorTag < Liquid::Tag
    def initialize(tag_name, author, tokens)
      super
      @author = author.strip
      @baseurl = Jekyll.sites[0].config['baseurl']
    end

    def render(context)
      teammate = finder('authors', @author)

      if teammate.nil?
        teammate = finder('pif_team', @author)
      end

      if teammate
        "<span class=\"author #{teammate['name']}\">" +
          "#{teammate['full_name']}" +
        "</span>"
      else
        raise Exception.new("No teammate found by that name: #{@author}")
      end
    end

    def finder(group, name)
        data = Jekyll.sites[0].data[group]
        if results.respond_to?('find')
          return results.find {|member| member["name"] == name}
        else
          require 'pry'; binding.pry
        end
    end
  end

  class AuthoredPosts < Liquid::Tag
    def initialize(tag_name, heading, tokens)
      super
      @heading = if heading
                   heading.split('=')[1].strip
                 else
                   'h2'
                 end
    end

    def render(context)
      authored = []
      author = context.environments[0]['page']['name']
      full_name = context.environments[0]['page']['full_name']
      first_name = context.environments[0]['page']['first_name']
      posts = context.environments[0]['site']['posts']
      site_url = context.environments[0]['site']['baseurl']
      for p in posts
        if p.data['authors'] and p.data['authors'].include? author
          authored.push(p)
        end
      end
      unless authored.empty?
        list = "<#{@heading}>#{first_name}’s blog posts:</#{@heading}>"
        list << "<ul>"
        for a in authored
          list << "<li><a href='#{site_url}#{a.url}'>#{a.data['title']}</a></li>"
        end
        list << "</ul>"
      end
    end
  end

  module AuthorFilter
    def initialize(context)
      @page_path = context.environments.first['page']['path']
      super
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
      if data[input]          # if there's an entry for input, return the value
        data[input][key]
      else                    # if not, exit with a "no such author error"
        puts "author.rb#lookup: No such author: #{input} in #{@page_path}".red
        False
      end
    end

    # method to set the site_url given the Jekyll configurations
    # works locally, on Federalist, and in production
    def set_site_url
      baseurl = Jekyll.sites[0].config['baseurl']
      config_url = Jekyll.sites[0].config['url']
      if baseurl.include? 'site/18F/18f.gsa.gov'
        config_url
      else
        baseurl
      end
    end

    # team_link filter
    #
    # A liquid filter that takes an author name as "input" and returns a link to an author's
    # page
    #
    # Example:
    # if we have a variable `author` set to "boone" the following syntax:
    # ```
    # {{ author | team_link }}
    # ```
    #
    # Returns an <a> tag linked to boone's author page
    # Content is boone's name
    def team_link(input)
      authors = Jekyll.sites[0].collections['authors'].docs
      index = authors.find_index do |x|
        if x.data['name'].nil?
          puts "No such author: #{input} in #{x}"
        else
          x.data['name'].downcase == input.downcase
        end
      end
      site_url = set_site_url

      if index.nil?
        # puts "L 143 author.rb: No such author: #{input} in #{@page_path}"
        author_data = SiteData::AuthorData.new
        full_name = author_data.fetch(input, 'full_name')
        if full_name
          full_name
        else
          puts "author.rb#team_link: No such author: #{input} in #{@page_path}".red
        end
      else
        name = authors[index].data['name'].downcase
        url = "#{site_url}/author/#{name}"
        full_name = authors[index].data['full_name']
        string = "<a class='post-author' itemprop='name' href='#{url}'>#{full_name}</a>"
      end
    end
  end
end

Liquid::Template.register_tag('author', Jekyll::AuthorTag)
Liquid::Template.register_tag('authored_posts', Jekyll::AuthoredPosts)
Liquid::Template.register_filter(Jekyll::AuthorFilter)
