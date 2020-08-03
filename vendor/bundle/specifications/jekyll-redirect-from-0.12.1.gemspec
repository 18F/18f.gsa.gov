# -*- encoding: utf-8 -*-
# stub: jekyll-redirect-from 0.12.1 ruby lib

Gem::Specification.new do |s|
  s.name = "jekyll-redirect-from".freeze
  s.version = "0.12.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Parker Moore".freeze]
  s.date = "2017-01-12"
  s.description = "Seamlessly specify multiple redirection URLs for your pages and posts".freeze
  s.email = ["parkrmoore@gmail.com".freeze]
  s.homepage = "https://github.com/jekyll/jekyll-redirect-from".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Seamlessly specify multiple redirection URLs for your pages and posts".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<jekyll>.freeze, ["~> 3.3"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_development_dependency(%q<jekyll-sitemap>.freeze, ["~> 0.8.1"])
      s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.43"])
    else
      s.add_dependency(%q<jekyll>.freeze, ["~> 3.3"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_dependency(%q<jekyll-sitemap>.freeze, ["~> 0.8.1"])
      s.add_dependency(%q<rubocop>.freeze, ["~> 0.43"])
    end
  else
    s.add_dependency(%q<jekyll>.freeze, ["~> 3.3"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<jekyll-sitemap>.freeze, ["~> 0.8.1"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.43"])
  end
end
