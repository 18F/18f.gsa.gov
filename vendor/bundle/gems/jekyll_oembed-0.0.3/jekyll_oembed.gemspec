# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = 'jekyll_oembed'
  gem.version       = '0.0.3'
  gem.authors       = ['18F']
  gem.license       = 'Nonstandard'
  gem.email         = ['brian.hedberg@gsa.com']
  gem.description   = 'Provides an oembed liquid tag for Jekyll'
  gem.summary       = "A gem that creates a liquid 'oembed'" \
    'tag for use in Jekyll sites'
  gem.homepage      = 'https://github.com/18F/jekyll-oembed'
  gem.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'jekyll', '~> 3'
  gem.add_dependency 'ruby-oembed', '~> 0'
end
