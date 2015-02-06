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

require 'hash-joiner'
require 'safe_yaml'


DATA_DIR = File.dirname __FILE__
YAML_FILES = [
  'projects.yml',
  'team.yml',
].map {|i| File.join(DATA_DIR, 'private', i)}.join ' '

exit $?.exitstatus unless system(
  "filter-yaml-files -o #{DATA_DIR} #{YAML_FILES}")