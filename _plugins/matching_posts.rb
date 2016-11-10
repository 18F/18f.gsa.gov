module Jekyll
  module MatchingPosts
    # Helper method to match apost property with its equivalent
    # page property
    def map_post_to_page(property)
      post_map = {
        authors: 'name',
        tags: 'tags'
      }
      post_map[property.to_sym]
    end

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
    def match_posts(page, property = 'tags')
      matching_posts = []
      page_property = map_post_to_page(property)
      page_criteria = Array(page[page_property]) || []
      Jekyll.sites[0].posts.docs.each do |sitepost|
        sitepost_criteria = sitepost[property] || []
        matching_post = sitepost_criteria & page_criteria
        matching_posts << sitepost if matching_post.any?
      end
      matching_posts
    end
  end
end

Liquid::Template.register_filter(Jekyll::MatchingPosts)
