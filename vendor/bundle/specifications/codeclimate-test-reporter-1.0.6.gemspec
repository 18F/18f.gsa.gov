# -*- encoding: utf-8 -*-
# stub: codeclimate-test-reporter 1.0.6 ruby lib

Gem::Specification.new do |s|
  s.name = "codeclimate-test-reporter".freeze
  s.version = "1.0.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Bryan Helmkamp".freeze, "Code Climate".freeze]
  s.date = "2017-02-22"
  s.description = "Collects test coverage data from your Ruby test suite and sends it to Code Climate's hosted, automated code review service. Based on SimpleCov.".freeze
  s.email = ["bryan@brynary.com".freeze, "hello@codeclimate.com".freeze]
  s.executables = ["cc-tddium-post-worker".freeze, "codeclimate-test-reporter".freeze]
  s.files = ["bin/cc-tddium-post-worker".freeze, "bin/codeclimate-test-reporter".freeze]
  s.homepage = "https://github.com/codeclimate/ruby-test-reporter".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9".freeze)
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Uploads Ruby test coverage data to Code Climate.".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_development_dependency(%q<pry>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_development_dependency(%q<webmock>.freeze, [">= 0"])
    else
      s.add_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_dependency(%q<pry>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_dependency(%q<webmock>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<webmock>.freeze, [">= 0"])
  end
end
