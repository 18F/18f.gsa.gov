source 'https://rubygems.org'

ruby '~>2.6.3'

gem 'accesslint-ci', '0.2.8'
gem 'html-proofer', '~> 3.6.0'
gem 'jekyll', '~> 3.6.3'
gem 'jemoji', '>= 0.11.1'
gem 'parallel'

group :jekyll_plugins do
  gem 'jekyll-archives', git: 'https://github.com/jekyll/jekyll-archives.git', ref: '112c508'
  gem 'jekyll-feed'
  gem 'jekyll-paginate'
  gem 'jekyll-redirect-from'
  gem 'jekyll-seo-tag'
  gem 'jekyll-sitemap'
  gem 'jekyll_frontmatter_tests', '~> 0.1.0'
  gem 'jekyll_pages_api'
  gem 'jekyll_pages_api_search', '~> 0.4.5'
  gem 'jekyll_oembed'
end

group :development do
  gem 'capybara', '>= 3.29.0'
  gem 'chromedriver-helper', '>= 2.1.1'
  gem 'colorize'
  gem 'pry'
  gem 'rack-jekyll', '>= 0.5.0'
  gem 'rb-readline'
  gem 'rspec'
  gem 'selenium-webdriver', '>= 3.1.0'
end

group :test do
  gem 'codeclimate-test-reporter', '~> 1.0.0'
  gem 'simplecov'
end
