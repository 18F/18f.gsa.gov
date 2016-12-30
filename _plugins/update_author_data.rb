# Updates author data on the site
# Detects if authors have "penned" posts
# And renders a page for them accordingly
# at /author/:name/
Jekyll::Hooks.register :site, :after_init do ||
  author_data = SiteData::AuthorData.new
  penned_authors = []

  site_post_paths = Dir.entries(File.join(Dir.pwd, '_posts')).select do |f|
    !File.directory? f and f != '.DS_Store'
  end

  all_authors = Dir.entries(File.join(Dir.pwd, '_authors')).select do |f|
    !File.directory? f and f != '.DS_Store'
  end.flatten.uniq

  site_post_paths.each do |post_path|
    frontmatter = YAML.load_file(File.join(Dir.pwd, '_posts/', post_path))
    if frontmatter['output'] != false && frontmatter['published'] != false
      authors = frontmatter['authors'].map { |a| "#{a}.md" }
      penned_authors << authors
    end
  end
  penned_authors = penned_authors.flatten.uniq
  excluded_authors = all_authors - penned_authors

  penned_authors.each do |author|
    author_data.update(author, 'published', true)
  end

  excluded_authors.each do |author|
    author_data.update(author, 'published', false)
  end
end
