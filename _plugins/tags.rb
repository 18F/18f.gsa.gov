require 'pry'
require 'rb-readline'

module Jekyll
  module MatchingPosts
    # match_posts filter
    #
    # A liquid filter that takes a page object
    #
    # Example:
    # ```
    # {{ page | match_posts }}
    # ```
    #
    # Will look for all the posts on the site
    # and return a list of posts that have any tag
    # that matches the list of `project_tags` defined
    # in a given project's frontmatter
    def match_posts(page)
      matching_posts = []
      Jekyll.sites[0].posts.docs.each do |sitepost|
        sitepost_tags = sitepost['tags'] || []
        page_tags = page['project_tags'] || []
        matching_post = sitepost_tags & page_tags
        if matching_post.any?
          matching_posts << sitepost
        end
      end
      matching_posts
    end
  end
end

Liquid::Template.register_filter(Jekyll::MatchingPosts)
