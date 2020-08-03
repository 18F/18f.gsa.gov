# -*- encoding: utf-8 -*-
# stub: jekyll_pages_api_search 0.4.5 ruby lib

Gem::Specification.new do |s|
  s.name = "jekyll_pages_api_search".freeze
  s.version = "0.4.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Mike Bland".freeze]
  s.date = "2018-06-18"
  s.description = "Contains a Jekyll plugin and associated files that facilitate adding client-side search features to a site using the jekyll_pages_api gem.".freeze
  s.email = ["michael.bland@gsa.gov".freeze]
  s.executables = ["jekyll_pages_api_search".freeze]
  s.files = ["bin/jekyll_pages_api_search".freeze]
  s.homepage = "https://github.com/18F/jekyll_pages_api_search".freeze
  s.licenses = ["CC0".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Adds lunr.js search based on the jekyll_pages_api gem".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<jekyll_pages_api>.freeze, ["~> 0.1.4"])
      s.add_runtime_dependency(%q<sass>.freeze, ["~> 3.4"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.7"])
      s.add_development_dependency(%q<jekyll>.freeze, [">= 0"])
      s.add_development_dependency(%q<minitest>.freeze, [">= 0"])
      s.add_development_dependency(%q<codeclimate-test-reporter>.freeze, [">= 0"])
      s.add_development_dependency(%q<coveralls>.freeze, [">= 0"])
      s.add_development_dependency(%q<test_temp_file_helper>.freeze, [">= 0"])
    else
      s.add_dependency(%q<jekyll_pages_api>.freeze, ["~> 0.1.4"])
      s.add_dependency(%q<sass>.freeze, ["~> 3.4"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.7"])
      s.add_dependency(%q<jekyll>.freeze, [">= 0"])
      s.add_dependency(%q<minitest>.freeze, [">= 0"])
      s.add_dependency(%q<codeclimate-test-reporter>.freeze, [">= 0"])
      s.add_dependency(%q<coveralls>.freeze, [">= 0"])
      s.add_dependency(%q<test_temp_file_helper>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<jekyll_pages_api>.freeze, ["~> 0.1.4"])
    s.add_dependency(%q<sass>.freeze, ["~> 3.4"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.7"])
    s.add_dependency(%q<jekyll>.freeze, [">= 0"])
    s.add_dependency(%q<minitest>.freeze, [">= 0"])
    s.add_dependency(%q<codeclimate-test-reporter>.freeze, [">= 0"])
    s.add_dependency(%q<coveralls>.freeze, [">= 0"])
    s.add_dependency(%q<test_temp_file_helper>.freeze, [">= 0"])
  end
end
