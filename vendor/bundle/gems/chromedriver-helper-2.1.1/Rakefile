require "bundler/gem_tasks"
require 'rspec/core/rake_task'
require 'concourse'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

Concourse.new("chromedriver-helper", fly_target: "flavorjones") do |c|
  c.add_pipeline "chromedriver-helper", "chromedriver-helper.yml"
  c.add_pipeline "chromedriver-helper-pr", "chromedriver-helper-pr.yml"
end
