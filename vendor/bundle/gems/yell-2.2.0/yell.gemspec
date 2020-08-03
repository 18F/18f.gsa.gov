# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yell/version'

Gem::Specification.new do |spec|
  spec.name        = "yell"
  spec.version     = Yell::VERSION
  spec.authors     = ["Rudolf Schmidt"]
  spec.license     = 'MIT'

  spec.homepage    = "http://rudionrailspec.github.com/yell"
  spec.summary     = %q{Yell - Your Extensible Logging Library}
  spec.description = %q{Yell - Your Extensible Logging Library. Define multiple adapters, various log level combinations or message formatting options like you've never done before}
  if spec.respond_to?(:metadata)
    # metadata keys must be strings, not symbols
    spec.metadata = {
      'github_repo'       => 'https://github.com/rudionrails/yell',
      'bug_tracker_uri'   => 'https://github.com/rudionrails/yell/issues',
      'documentation_uri' => 'http://rudionrailspec.github.com/yell',
      'homepage_uri'      => 'http://rudionrailspec.github.com/yell',
      'source_code_uri'   => 'https://github.com/rudionrails/yell',
      'wiki_uri'          => 'http://rudionrailspec.github.com/yell'
    } 
  end

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
end

