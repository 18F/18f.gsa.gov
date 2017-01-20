source 'https://rubygems.org'

ruby '2.3.1'
gem 'redcarpet'
gem 'jekyll', '~> 3.3'
gem 'html-proofer'
gem 'accesslint-ci', '0.2.6'

group :jekyll_plugins do
  if ENV['FAST_BUILDS'] == 'true'
    puts 'not using jekyll-archives because its sloooooooooow'
  else
    gem 'jekyll-archives', git: 'https://github.com/18F/jekyll-archives.git'
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
  gem 'capybara'
  gem 'chromedriver-helper'
  gem 'colorize'
  gem 'pry'
  gem 'rack-jekyll'
  gem 'rb-readline'
  gem 'rspec'
  gem 'selenium-webdriver'
end

group :test do
  gem 'simplecov'
  gem 'codeclimate-test-reporter', '~> 1.0.0'
end
