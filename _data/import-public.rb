#! /usr/bin/env ruby
#
# Imports project data from the 18F Public Hub API.
#
# Author: Mike Bland (michael.bland@gsa.gov)
# Date:   2014-12-22

require 'open-uri'
require 'json'

DATA_DIR = File.dirname __FILE__
TEAM_API_BASE_URL = 'https://team-api.18f.gov/public/api/'

['team'].each do |category|
  category_data = (open("#{TEAM_API_BASE_URL}#{category}/").read)
  results = JSON.parse(category_data)["results"]
  open(File.join(DATA_DIR, "#{category}.json"), 'w') do |f|
    f.write(results.to_json)
  end
end
