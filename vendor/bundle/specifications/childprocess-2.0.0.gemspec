# -*- encoding: utf-8 -*-
# stub: childprocess 2.0.0 ruby lib
# stub: ext/mkrf_conf.rb

Gem::Specification.new do |s|
  s.name = "childprocess".freeze
  s.version = "2.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jari Bakken".freeze, "Eric Kessler".freeze, "Shane da Silva".freeze]
  s.date = "2019-07-11"
  s.description = "This gem aims at being a simple and reliable solution for controlling external programs running in the background on any Ruby / OS combination.".freeze
  s.email = ["morrow748@gmail.com".freeze, "shane@dasilva.io".freeze]
  s.extensions = ["ext/mkrf_conf.rb".freeze]
  s.files = ["ext/mkrf_conf.rb".freeze]
  s.homepage = "http://github.com/enkessler/childprocess".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3.0".freeze)
  s.rubygems_version = "3.0.3".freeze
  s.summary = "A simple and reliable solution for controlling external programs running in the background on any Ruby / OS combination.".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<yard>.freeze, ["~> 0.0"])
      s.add_development_dependency(%q<coveralls>.freeze, ["< 1.0"])
      s.add_runtime_dependency(%q<rake>.freeze, ["< 13.0"])
    else
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_dependency(%q<yard>.freeze, ["~> 0.0"])
      s.add_dependency(%q<coveralls>.freeze, ["< 1.0"])
      s.add_dependency(%q<rake>.freeze, ["< 13.0"])
    end
  else
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<yard>.freeze, ["~> 0.0"])
    s.add_dependency(%q<coveralls>.freeze, ["< 1.0"])
    s.add_dependency(%q<rake>.freeze, ["< 13.0"])
  end
end
