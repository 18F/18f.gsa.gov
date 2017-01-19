require 'pry'
require 'rb-readline'
module Jekyll
  class RelGenerator < Liquid::Tag
    def initialize(related_posts, text, tokens)
      super
      @params = text.split(' ')
      @baseurl = Jekyll.sites[0].config['baseurl']
    end

    # Gets all posts from the site by tag and adds those that match the tags on
    # the current page. Returns a flattened, deduped, array of post objects
    def get_posts_by_tag(page, siteTags)
      tags = page['tags']
      other_posts = []
      for tag in tags
        other_posts.push(siteTags[tag])
        other_posts = other_posts.flatten.uniq
        other_posts.delete_if { |post| page['title'] == post['title'] }
      end
      other_posts
    end

    # Grabs all posts from the site and matches the authors on the current page
    # to other posts authored on the site. This may take a long time for large
    # sites. Returns an array of posts
    def get_posts_by_author(other_posts, page, site)
      posts = site['posts']
      if page['authors']
        authors = page['authors']
        authors.map { |author| posts.map { |post| if post.data['authors'] && post.data['authors'].index(author) then other_posts.push(post) end } }
      end
      other_posts.delete_if { |post| page['title'] == post['title'] }
      other_posts
    end

    # Creates a list of posts from an array of post objects.
    def list_posts(other_posts)
      external = @params[0] || 'ul'
      internal = @params[1] || 'li'
      if other_posts
        related_posts = "<#{external}>"
        other_posts.flatten.map { |post| related_posts << "<#{internal}><a href='#{@baseurl}#{post.url}' class='related_posts'>&ldquo;#{post.data['title']}&rdquo;</a></#{internal}>" }
        related_posts << "</#{external}"
      else
        related_posts = '<p>No related posts</p>'
      end
    end

    # Grabs an array of posts by tag. If that array has fewer than 3 posts,
    # grabs more posts by author. Returns a list of the first five posts in the
    # array.
    def render(context)
      page = context['page']
      site = context['site']
      siteTags = site['tags']
      other_posts = get_posts_by_tag(page, siteTags)
      other_posts = get_posts_by_author(other_posts, page, site) if other_posts.flatten.length < 3
      related_posts = list_posts(other_posts.uniq.take(3))
    end
  end
end
Liquid::Template.register_tag('related_posts', Jekyll::RelGenerator)
