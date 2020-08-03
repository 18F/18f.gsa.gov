# -*- encoding: utf-8 -*-
# stub: rack-jekyll 0.5.0 ruby lib

Gem::Specification.new do |s|
  s.name = "rack-jekyll".freeze
  s.version = "0.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Bryan Goines".freeze, "Ad\u00E3o Raul".freeze]
  s.date = "2016-07-28"
  s.description = "Rack-Jekyll transforms your Jekyll app into a Rack application.".freeze
  s.email = "adao.raul@gmail.com".freeze
  s.extra_rdoc_files = ["README.markdown".freeze, "History.markdown".freeze, "LICENSE".freeze]
  s.files = ["History.markdown".freeze, "LICENSE".freeze, "README.markdown".freeze]
  s.homepage = "https://github.com/adaoraul/rack-jekyll".freeze
  s.rdoc_options = ["--charset=UTF-8".freeze, "--main=README.markdown".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3".freeze)
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Transform your Jekyll app into a Rack application.".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<jekyll>.freeze, [">= 1.3"])
      s.add_runtime_dependency(%q<rack>.freeze, ["~> 1.5"])
      s.add_runtime_dependency(%q<listen>.freeze, [">= 1.3"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<minitest>.freeze, [">= 0"])
    else
      s.add_dependency(%q<jekyll>.freeze, [">= 1.3"])
      s.add_dependency(%q<rack>.freeze, ["~> 1.5"])
      s.add_dependency(%q<listen>.freeze, [">= 1.3"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<minitest>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<jekyll>.freeze, [">= 1.3"])
    s.add_dependency(%q<rack>.freeze, ["~> 1.5"])
    s.add_dependency(%q<listen>.freeze, [">= 1.3"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<minitest>.freeze, [">= 0"])
  end
end
