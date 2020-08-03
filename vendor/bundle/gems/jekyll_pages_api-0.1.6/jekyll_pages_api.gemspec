# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll_pages_api/version'

Gem::Specification.new do |spec|
  spec.name          = "jekyll_pages_api"
  spec.version       = JekyllPagesApi::VERSION
  spec.authors       = ["Aidan Feldman"]
  spec.email         = ["aidan.feldman@gsa.gov"]
  spec.summary       = %q{A Jekyll Plugin that generates a JSON file with data for all the Pages in your Site.}
  spec.homepage      = "https://github.com/18F/jekyll_pages_api"
  spec.license       = "CC0-1.0"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "htmlentities", "~> 4.3"
  spec.add_dependency "jekyll", [">= 2.0", "< 4.0"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
