lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll_frontmatter_tests/version'

Gem::Specification.new do |s|
  s.description = 'Tests the frontmatter of posts and other collection documents against a schema'
  s.summary     = 'Tests jekyll documents for proper frontmatter'
  s.name        = 'jekyll_frontmatter_tests'
  s.date        = '2015-09-10'
  s.license     = 'CC0'
  s.authors     = ['Greg Boone']
  s.email       = ['gregory.boone@gsa.gov']
  s.version     = JekyllFrontmatterTests::VERSION
  s.files       = %w{
                   jekyll-frontmatter-tests.gemspec
                   Gemfile
                 } +
                 Dir.glob("lib/**/*")
  s.homepage    = 'https://rubygems.org/gems/jekyll_frontmatter_tests'
  s.bindir = 'bin'
  s.post_install_message = "Happy testing!"
  s.add_dependency "jekyll", [">= 2.0", "< 4.0"]
  s.add_development_dependency "bundler", "~> 1.7"
  s.add_development_dependency "rspec", "~> 3.0"
  s.add_development_dependency "pry", '~> 0'
  s.add_development_dependency "capybara", '~> 2.11'
  s.add_development_dependency "chromedriver-helper", '~> 1.0'
  s.add_development_dependency "rack-jekyll", '~> 0.5'
  s.add_development_dependency "rb-readline", '~> 0.5.3'
  s.add_development_dependency "selenium-webdriver", '~> 3.0'
  s.add_development_dependency "rubocop", '~> 0.47.1'
end
