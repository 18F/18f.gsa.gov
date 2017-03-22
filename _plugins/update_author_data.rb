# Updates author data on the site
# Detects if authors have published posts
# And renders a page for them accordingly
# at /author/:name/
Jekyll::Hooks.register :site, :after_init do ||
  author_data = SiteData::AuthorData.new

  author_data.published_authors.each do |author|
    author_data.update(author, 'published', true)
  end

  author_data.unpublished_authors.each do |author|
    author_data.update(author, 'published', false)
  end
end
