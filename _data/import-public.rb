#! /usr/bin/env ruby
#
# Imports data from _data/private into _data/public.
#
# Expects to be run directly within the _data directory with the _data/private
# submodule present. All 'private:' data is stripped from the _data/private
# files before it is dumped into _data/public.
#
# Author: Mike Bland (michael.bland@gsa.gov)
# Date:   2014-12-22

DATA_DIR = File.dirname __FILE__
['team', 'projects'].each do |category|
  pattern = File.join DATA_DIR, 'private', category, '*.yml'
  files = Dir.glob(pattern).join ' '
  outfile = File.join DATA_DIR, "#{category}.yml"
  exit $?.exitstatus unless system(
    "bundle exec consolidate-yaml-files #{files} > #{outfile}")
end
