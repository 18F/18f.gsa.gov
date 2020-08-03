# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "chromedriver/helper/version"

def windows?
  RbConfig::CONFIG["target_os"] =~ /mingw32|mswin/
end

Gem::Specification.new do |s|
  s.name = "chromedriver-helper"
  s.version = Chromedriver::Helper::VERSION
  s.authors = ["Mike Dalessio"]
  s.email = ["mike.dalessio@gmail.com"]
  s.homepage = "https://github.com/flavorjones/chromedriver-helper"
  s.summary = "Deprecated in favor of the 'webdrivers' gem."
  s.description = "Deprecated in favor of the 'webdrivers' gem as of 2019-03-31. See https://github.com/flavorjones/chromedriver-helper/issues/83"
  s.licenses = ["MIT"]

  s.post_install_message = <<EOM

  +--------------------------------------------------------------------+
  |                                                                    |
  |  NOTICE: chromedriver-helper is deprecated after 2019-03-31.       |
  |                                                                    |
  |  Please update to use the 'webdrivers' gem instead.                |
  |  See https://github.com/flavorjones/chromedriver-helper/issues/83  |
  |                                                                    |
  +--------------------------------------------------------------------+

EOM

  begin
    s.files = `git ls-files`.split("\n")
    s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
    s.executables = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  rescue Exception => e
    warn "WARNING: could not set spec.files: #{e.class}: #{e}"
  end
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec", "~> 3.0"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "concourse", "~> 0.23"

  s.add_runtime_dependency "nokogiri", "~> 1.8"
  s.add_runtime_dependency "archive-zip", "~> 0.10"
end
