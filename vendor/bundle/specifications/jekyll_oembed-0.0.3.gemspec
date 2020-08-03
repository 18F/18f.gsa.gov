# -*- encoding: utf-8 -*-
# stub: jekyll_oembed 0.0.3 ruby lib

Gem::Specification.new do |s|
  s.name = "jekyll_oembed".freeze
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["18F".freeze]
  s.date = "2017-03-02"
  s.description = "Provides an oembed liquid tag for Jekyll".freeze
  s.email = ["brian.hedberg@gsa.com".freeze]
  s.homepage = "https://github.com/18F/jekyll-oembed".freeze
  s.licenses = ["Nonstandard".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "A gem that creates a liquid 'oembed'tag for use in Jekyll sites".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<jekyll>.freeze, ["~> 3"])
      s.add_runtime_dependency(%q<ruby-oembed>.freeze, ["~> 0"])
    else
      s.add_dependency(%q<jekyll>.freeze, ["~> 3"])
      s.add_dependency(%q<ruby-oembed>.freeze, ["~> 0"])
    end
  else
    s.add_dependency(%q<jekyll>.freeze, ["~> 3"])
    s.add_dependency(%q<ruby-oembed>.freeze, ["~> 0"])
  end
end
