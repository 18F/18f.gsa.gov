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
      page_tags = page['tags'] || []
      Jekyll.sites[0].posts.docs.each do |sitepost|
        sitepost_tags = sitepost['tags'] || []
        matching_post = sitepost_tags & page_tags
        matching_posts << sitepost if matching_post.any?
      end
      matching_posts
    end
  end
end

Liquid::Template.register_filter(Jekyll::MatchingPosts)
