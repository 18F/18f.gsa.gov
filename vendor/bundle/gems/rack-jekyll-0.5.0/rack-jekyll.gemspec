# coding: utf-8

require_relative "lib/rack/jekyll/version"

Gem::Specification.new do |s|
 s.required_rubygems_version = ">= 1.3.6"

 s.name        = "rack-jekyll"
 s.version     = Rack::Jekyll.version

 s.summary     = "Transform your Jekyll app into a Rack application."
 s.description = "Rack-Jekyll transforms your Jekyll app into a Rack application."

 s.authors  = ["Bryan Goines", "Adão Raul"]
 s.email    = "adao.raul@gmail.com"
 s.homepage = "https://github.com/adaoraul/rack-jekyll"

 s.files = %w{
             README.markdown
             rack-jekyll.gemspec
             Gemfile
             Rakefile
             History.markdown
             LICENSE
           } +
           Dir.glob("lib/**/*") +
           Dir.glob("example/**/*").reject {|f| f =~ %r(\Aexample/_site/) }
 s.test_files = Dir.glob("{test,features}/**/*")
 s.require_paths = ["lib"]

 s.extra_rdoc_files = %w[README.markdown History.markdown LICENSE]
 s.rdoc_options = ['--charset=UTF-8', '--main=README.markdown']

 s.required_ruby_version = '>= 1.9.3'

 s.add_dependency "jekyll", ">= 1.3"
 s.add_dependency "rack", "~> 1.5"
 s.add_dependency "listen", ">= 1.3"

 s.add_development_dependency "rake"
 s.add_development_dependency "minitest"

 s.platform = Gem::Platform::RUBY
 s.rubyforge_project = "rack-jekyll"
end
