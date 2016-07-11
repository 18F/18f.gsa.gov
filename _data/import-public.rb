#! /usr/bin/env ruby
#
# Imports project data from the 18F Public Hub API.

require "open-uri"
require "json"

DATA_DIR = File.dirname __FILE__
TEAM_DIR = "_team"
TEAM_API_BASE_URL = "https://team-api.18f.gov/public/api/"
TEAM_ENDPOINT = "team"
MEMBER_PROPERTIES = [
  "city",
  "first_name",
  "full_name",
  "github",
  "last_name",
  "name",
  "role",
  "state",
  "team",
  "twitter",
].freeze


def update_team_file
  results = JSON.parse(team_data)["results"]

  open(File.join(DATA_DIR, "#{TEAM_ENDPOINT}.json"), "w") do |f|
    f.write(results.to_json)
  end
end

def add_files_for_new_team_members
  team_json_data = JSON.parse(team_data)["results"]

  team_json_data.each do |person|
    unless team_member_name = person["deprecated_name"].tr(".", "-")
      team_member_name = person["name"].tr(".", "-")
    end
    puts(team_member_name)
    team_member_file_path = File.join(TEAM_DIR, "#{team_member_name}.md")
    ignored = File.readlines(".gitignore").index(team_member_file_path)
    exists = File.exist?(team_member_file_path)
    unless ignored.nil?
      next
    end
    unless  exists
      markdown_data = format_team_member_json_for_markdown(team_member_data)
      File.write(team_member_file_path, markdown_data)
    end
  end
end

def team_data
  open("#{TEAM_API_BASE_URL}#{TEAM_ENDPOINT}/").read
end

def format_team_member_json_for_markdown(team_member_data)
  team_member_attributes = MEMBER_PROPERTIES.map do |property|
    attribute = team_member_data[property]
    "#{property}: #{attribute}"
  end

  team_member_attributes.unshift("---")
  team_member_attributes << "---"
  team_member_attributes.join("\n")
end

update_team_file
add_files_for_new_team_members
