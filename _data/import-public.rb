#! /usr/bin/env ruby
#
# Imports project data from the 18F Public Hub API.
#
# Author: Mike Bland (michael.bland@gsa.gov)
# Date:   2014-12-22

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
fm_rexexp = Regexp.new('^---.*---$', Regexp::MULTILINE)

Dir[File.join [DATA_DIR] + %w(.. _team *.md)].each do |member_file|
  name = File.basename(member_file)[0..-4] # Trim .md extension
  member_data = data[name]
  next if member_data.nil?
  content = File.read member_file
  member_fm = SafeYAML.load content
  props = ['first_name', 'last_name', 'location', 'role', 'team']
  props.each {|i| member_fm[i] ||= member_data[i]}
  File.write member_file, content.sub(fm_rexexp, "#{member_fm.to_yaml}---")
end
