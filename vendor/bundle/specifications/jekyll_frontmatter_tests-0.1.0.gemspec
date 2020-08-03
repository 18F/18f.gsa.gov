# -*- encoding: utf-8 -*-
# stub: jekyll_frontmatter_tests 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "jekyll_frontmatter_tests".freeze
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Greg Boone".freeze]
  s.date = "2015-09-10"
  s.description = "Tests the frontmatter of posts and other collection documents against a schema".freeze
  s.email = ["gregory.boone@gsa.gov".freeze]
  s.homepage = "https://rubygems.org/gems/jekyll_frontmatter_tests".freeze
  s.licenses = ["CC0".freeze]
  s.post_install_message = "Happy testing!".freeze
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Tests jekyll documents for proper frontmatter".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<jekyll>.freeze, [">= 2.0", "< 4.0"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.7"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<pry>.freeze, ["~> 0"])
      s.add_development_dependency(%q<capybara>.freeze, ["~> 2.11"])
      s.add_development_dependency(%q<chromedriver-helper>.freeze, ["~> 1.0"])
      s.add_development_dependency(%q<rack-jekyll>.freeze, ["~> 0.5"])
      s.add_development_dependency(%q<rb-readline>.freeze, ["~> 0.5.3"])
      s.add_development_dependency(%q<selenium-webdriver>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.47.1"])
    else
      s.add_dependency(%q<jekyll>.freeze, [">= 2.0", "< 4.0"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.7"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_dependency(%q<pry>.freeze, ["~> 0"])
      s.add_dependency(%q<capybara>.freeze, ["~> 2.11"])
      s.add_dependency(%q<chromedriver-helper>.freeze, ["~> 1.0"])
      s.add_dependency(%q<rack-jekyll>.freeze, ["~> 0.5"])
      s.add_dependency(%q<rb-readline>.freeze, ["~> 0.5.3"])
      s.add_dependency(%q<selenium-webdriver>.freeze, ["~> 3.0"])
      s.add_dependency(%q<rubocop>.freeze, ["~> 0.47.1"])
    end
  else
    s.add_dependency(%q<jekyll>.freeze, [">= 2.0", "< 4.0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.7"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<pry>.freeze, ["~> 0"])
    s.add_dependency(%q<capybara>.freeze, ["~> 2.11"])
    s.add_dependency(%q<chromedriver-helper>.freeze, ["~> 1.0"])
    s.add_dependency(%q<rack-jekyll>.freeze, ["~> 0.5"])
    s.add_dependency(%q<rb-readline>.freeze, ["~> 0.5.3"])
    s.add_dependency(%q<selenium-webdriver>.freeze, ["~> 3.0"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.47.1"])
  end
end
