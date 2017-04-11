---
title: 18F UI style guide
subpage: Using Jekyll
permalink: /styleguide/using-jekyll/
---

[18f.gsa.gov](https://18f.gsa.gov), and many 18F websites deployed to [Federalist](federalist.fr.cloud.gov) use [Jekyll](https://jekyllrb.com/) to build static, maintainable websites.

One of the core features of Jekyll is the [Liquid](https://shopify.github.io/liquid/) templating language, which has a series of [filters](https://shopify.github.io/liquid/filters/round/) and [tags](https://shopify.github.io/liquid/tags/iteration/) that allow developers programmatically generate content.

Jekyll and Liquid do quite a bit, but sometimes they aren't enough for a project's specific needs. When the built-in functionality that Jekyll provides isn't enough, it is possible to build or borrow [plugins](https://jekyllrb.com/docs/plugins) to extend Jekyll.

---
### Plugin gems

18f.gsa.gov is using several Ruby gems plugins:

Plugin gem | Description
--- | ---
[`jekyll-archives`](https://github.com/jekyll/jekyll-archives) | creates and manages blog-related pages.
[`jekyll-feed`](https://github.com/jekyll/jekyll-feed) | generates an Atom (RSS-like) feed at [`/feed.xml`](https://18f.gsa.gov/feed.xml).
[`jekyll-paginate`](https://jekyllrb.com/docs/pagination/) | allows for pagination of blog pages, or pages with long lists of items.
[`jekyll-redirect-from`](https://github.com/jekyll/jekyll-redirect-from) | enables redirecting from pages that are no longer active.
[`jekyll-seo-tag`](https://github.com/jekyll/jekyll-seo-tag) | adds metadata tags for search engines and social networks.
[`jekyll-sitemap`](https://github.com/jekyll/jekyll-sitemap) | generates a sitemap at [`/sitemap.xml`](https://18f.gsa.gov/sitemap.xml). This makes it easier for search engines to find us.
[`jekyll_frontmatter_tests`](https://github.com/18F/jekyll_frontmatter_tests) | tests to see if the correct front matter (meta data) is present on pages throughout our website.
[`jekyll_pages_api`](https://github.com/18F/jekyll_pages_api) | generates a JSON file at [`/api/v1/pages.json`](https://18f.gsa.gov/api/v1/pages.json) that serves as the base for a site search engine.
[`jekyll_pages_api_search`](https://github.com/18F/jekyll_pages_api_search) | search engine that uses `jekyll_pages_api`
[`jekyll_oembed`](https://github.com/18F/jekyll-oembed) | creates a Liquid tag that uses [OEmbed](https://github.com/ruby-oembed/ruby-oembed)

---

### Custom plugins
18f.gsa.gov uses many [custom plugins](https://github.com/18F/18f.gsa.gov/tree/master/_plugins) for more specific site needs:

Custom plugin name | Description
--- | ---
[author.rb](https://github.com/18F/18f.gsa.gov/blob/master/_plugins/author.rb) | creates two filters, [`lookup`](https://github.com/18F/18f.gsa.gov/tree/master/_plugins#lookup) and [`team_link`](https://github.com/18F/18f.gsa.gov/tree/master/_plugins#team_link).
[author_data.rb](https://github.com/18F/18f.gsa.gov/blob/master/_plugins/author_data.rb) | Creates an [API](https://github.com/18F/18f.gsa.gov/tree/master/_plugins#authordata) for using data pertaining to authors throughout the site.
[update_author_data.rb](https://github.com/18F/18f.gsa.gov/blob/master/_plugins/update_author_data.rb) | Uses the AuthorData API to update the list of published authors. This will happen automatically every time the site builds.
[embed.rb](https://github.com/18F/18f.gsa.gov/tree/master/_plugins#embed) | legacy filter for embedding content within the site. The current approach is to use an [OEmbed plugin]({{ site.basurl }}/styleguide/oembeds/).
[liquify.rb](https://github.com/18F/18f.gsa.gov/tree/master/_plugins#liquify) | liquid parser.
[markdown.rb](https://github.com/18F/18f.gsa.gov/tree/master/_plugins#markdown-rendering) | markdown parser.
[matching_posts.rb](https://github.com/18F/18f.gsa.gov/tree/master/_plugins#match_posts) | creates a `match_posts` filter that creates a list of posts belonging to a specific author.
[team.rb](https://github.com/18F/18f.gsa.gov/tree/master/_plugins#team_photo) | creates a `team_photo` filter that matches an author to their provided team photo. [More documentation](http://localhost:4000/site/styleguide/images/#adding-a-photo-of-an-18f-team-member).
[utility.rb](https://github.com/18F/18f.gsa.gov/tree/master/_plugins#filters) | A list of Liquid filters that can be used for a variety of purposes: `clip_char`, `hash_link`, `matches_url`, `debug`, `find_collection`, `where_obj`, `in_groups`, and `weighted_sort`.
