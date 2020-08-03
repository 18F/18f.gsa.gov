# -*- encoding: utf-8 -*-
# stub: jekyll_pages_api 0.1.6 ruby lib

Gem::Specification.new do |s|
  s.name = "jekyll_pages_api".freeze
  s.version = "0.1.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Aidan Feldman".freeze]
  s.date = "2016-05-20"
  s.email = ["aidan.feldman@gsa.gov".freeze]
  s.executables = ["jekyll_pages_api".freeze]
  s.files = ["bin/jekyll_pages_api".freeze]
  s.homepage = "https://github.com/18F/jekyll_pages_api".freeze
  s.licenses = ["CC0-1.0".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "A Jekyll Plugin that generates a JSON file with data for all the Pages in your Site.".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<htmlentities>.freeze, ["~> 4.3"])
      s.add_runtime_dependency(%q<jekyll>.freeze, [">= 2.0", "< 4.0"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.7"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
    else
      s.add_dependency(%q<htmlentities>.freeze, ["~> 4.3"])
      s.add_dependency(%q<jekyll>.freeze, [">= 2.0", "< 4.0"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.7"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    end
  else
    s.add_dependency(%q<htmlentities>.freeze, ["~> 4.3"])
    s.add_dependency(%q<jekyll>.freeze, [">= 2.0", "< 4.0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.7"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
  end
end
