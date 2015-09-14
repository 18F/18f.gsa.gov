#! /usr/bin/env ruby
#
# Imports project data from the 18F Public Hub API.
#
# Author: Mike Bland (michael.bland@gsa.gov)
# Date:   2014-12-22

require 'jekyll'
require 'json'
require 'open-uri'
require 'safe_yaml'

DATA_DIR = File.dirname __FILE__
DATA_BASEURL = 'https://18f.gsa.gov/hub/api/'

['team', 'projects', 'pif_team', 'pif_projects'].each do |category|
  open("#{DATA_BASEURL}#{category}/") do |data|
    open(File.join(DATA_DIR, "#{category}.json"), 'w') do |f|
      f.write(data.read)
    end
  end
end

data = JSON.load File.read(File.join(DATA_DIR, 'team.json'))

Dir[File.join [DATA_DIR] + %w(.. _team *)].each do |member_file|
  name = File.basename(member_file, File.extname(member_file))
  member_data = data[name]
  next if member_data.nil?
  content = File.read member_file
  member_fm = SafeYAML.load content
  props = ['first_name', 'last_name', 'location', 'role', 'team']
  props.each {|i| member_fm[i] = member_data[i] unless member_data[i].nil?}
  File.write(member_file,
    content.sub(Jekyll::Document::YAML_FRONT_MATTER_REGEXP,
      "#{member_fm.to_yaml}---\n"))
end
