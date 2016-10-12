source "https://rubygems.org"

ruby "2.3.1"
gem "redcarpet"
gem "jekyll", '~> 3.1'
gem "html-proofer"

group :jekyll_plugins do
  if ENV['FAST_BUILDS']
    puts 'not using jekyll-archives because its sloooooooooow'
  else
    gem 'jekyll-archives', :git => 'https://github.com/jekyll/jekyll-archives.git'
  end

  gem 'jekyll_pages_api'
  gem 'jekyll_pages_api_search'
  gem 'jekyll-sitemap'
  gem 'jekyll-paginate'
  gem 'jekyll-redirect-from'
  gem 'jekyll_frontmatter_tests'
  gem 'jekyll-feed'
  gem 'jekyll-seo-tag'
end
gem 'jemoji'
group :development do
  gem 'pry'
end
