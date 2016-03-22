#! /usr/bin/env ruby
#
# Go script for building the 18F site
#
# Written in 2015 by Mike Bland (michael.bland@gsa.gov) and Greg Boone
# (gregory.boone@gsa.gov) on behalf of the 18F team, part of the US General
# Services Administration: https://18f.gsa.gov/
#
# To the extent possible under law, the author(s) have dedicated all copyright
# and related and neighboring rights to this software to the public domain
# worldwide. This software is distributed without any warranty.
#
# You should have received a copy of the CC0 Public Domain Dedication along
# with this software. If not, see
# <https://creativecommons.org/publicdomain/zero/1.0/>.
#
# @author Mike Bland (michael.bland@gsa.gov)
# @author Greg Boone (gregory.boone@gsa.gov)
#
# ----
#
# ./go script: unified development environment interface
#
# Inspired by:
# http://www.thoughtworks.com/insights/blog/praise-go-script-part-i
# http://www.thoughtworks.com/insights/blog/praise-go-script-part-ii
#
# Author: Mike Bland (michael.bland@gsa.gov)
# Date:   2015-01-10
def exec_cmd(cmd)
  exit $?.exitstatus unless system(cmd, :err => :out)
end

def init
  begin
    require 'bundler'
  rescue LoadError
    puts "Installing Bundler gem..."
    exec_cmd 'gem install bundler'
    puts "Bundler installed; installing gems"
  end
  exec_cmd 'bundle install'
end

def update_gems(development=true)
  # Installs and updates gems to the correct version, in case it's been a while
  if development
    exec_cmd 'bundle install'
  else
    exec_cmd 'bundle install --without development'
  end
end

def update_data
  ruby = exec_cmd 'which ruby'
  exec_cmd "ruby _data/import-public.rb"
end

def serve
  exec 'bundle exec jekyll serve --trace --incremental'
end

def build(watch = false, config=false)
  puts 'Building the site...'
  cmd = 'bundle exec jekyll b --trace --incremental'
  if watch == false
    cmd = "#{cmd} --no-watch"
  end
  if config
    cmd = "#{cmd} --config _config.yml,#{config}"
  end
  puts(cmd)
  exec_cmd(cmd)
  puts 'Site built successfully.'
end

def ci_build
  reset
  build
  test
  puts 'Done!'
end

def server_build
  puts 'Fetching from git'
  exec_cmd 'git fetch origin staging'
  exec_cmd 'git reset --hard origin/staging'
  update_gems(development=false)
  reset
  puts 'building site'
  build
  require 'time'
  puts Time.now()
end

def production_build
  puts 'Fetching from git'
  exec_cmd 'git fetch origin staging'
  exec_cmd 'git reset --hard origin/staging'
  update_gems
  reset
  puts 'building site'
  build(watch=false, config="_config-deploy.yml")
  require 'time'
  puts Time.now()
end

def cf_deploy
  build
  test
  exec_cmd('sh deploy/cf-deploy.sh')
end

def test
  exec_cmd('bundle exec deploy/tests/test.rb')
  exec_cmd('bundle exec jekyll test')
end

def pre_deploy
  ci_build
end

def reset
  exec_cmd('bundle exec jekyll clean')
end

COMMANDS = {
  :init => 'Set up the 18f.gsa.gov dev environment',
  :update_gems => 'Update your rubygems, do this if you have problems building',
  :update_data => 'Updates data files from the public Hub',
  :serve => 'Serves the site at localhost:4000',
  :build => 'Builds the site',
  :ci_build => 'Builds the site for a CI system',
  :server_build => 'Pulls from git and builds the site with `jekyll-get` enabled',
  :cf_deploy => 'Deploys to cloudfoundry',
  :production_build => 'Deploys to production using a second config file',
  :test => 'Tests the fontmatter and site build.',
  :pre_deploy => 'Builds the site and runs associated tests',
  :reset => 'Clears the build cache'
}

def usage(exitstatus: 0)
  puts <<EOF
Usage: #{$0} [options] [command]

options:
  -h,--help  Show this help

commands:
EOF

  padding = COMMANDS.keys.max_by {|i| i.size}.size + 2
  COMMANDS.each do |name, desc|
    puts "  %-#{padding}s#{desc}" % name
  end
  exit exitstatus
end

usage(exitstatus: 1) unless ARGV.size == 1
command = ARGV.shift
usage if ['-h', '--help'].include? command

command = command.to_sym
unless COMMANDS.member? command
  puts "Unknown option or command: #{command}"
  usage(exitstatus: 1)
end
send command
