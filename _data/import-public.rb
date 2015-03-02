#! /usr/bin/env ruby
#
# Imports project data from the 18F Public Hub API.
#
# Author: Mike Bland (michael.bland@gsa.gov)
# Date:   2014-12-22

require 'open-uri'

DATA_DIR = File.dirname __FILE__
DATA_BASEURL = 'https://18f.gsa.gov/hub/api/'

['team', 'projects', 'pif_team', 'pif_projects'].each do |category|
  open("#{DATA_BASEURL}#{category}/") do |data|
    open(File.join(DATA_DIR, "#{category}.json"), 'w') do |f|
      f.write(data.read)
    end
  end
end
