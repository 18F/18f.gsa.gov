Jekyll::Hooks.register :site, :post_render do |site|
  collections = site.collections

  authors = collections['authors']

  print authors

  authors.docs.each do |author|
    author_data = author.data
    puts author
    author_name = author_data['name']
    author_data['redirect_from'] = "#{site.baseurl}/team/#{author_name}/"
  end

  # Just after the site initializes, but before setup & render.
  # Good for modifying the configuration of the site.
end
