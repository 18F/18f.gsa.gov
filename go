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

MIN_VERSION = "2.1.0"

unless RUBY_VERSION >= MIN_VERSION
  puts <<EOF

*** ABORTING: Unsupported Ruby version ***

Ruby version #{MIN_VERSION} or greater is required to build 18f.gsa.gov, but
this Ruby is version #{RUBY_VERSION}. Consider using a version manager such as
rbenv (https://github.com/sstephenson/rbenv) or rvm (https://rvm.io/)
to install a Ruby version specifically for 18f.gsa.gov development.

EOF
  exit 1
end

def exec_cmd(cmd)
  exit $?.exitstatus unless system(cmd)
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

def update_gems
  # Installs and updates gems to the correct version, in case it's been a while
  exec_cmd 'bundle install'
end

def update_data
  ruby = exec_cmd 'which ruby'
  exec_cmd "ruby _data/import-public.rb"
end

def serve
  exec 'bundle exec jekyll serve --trace --no-watch'
end

def build
  puts 'Building the site...'
  exec_cmd('bundle exec jekyll b --trace')
  puts 'Site built successfully.'
end

def ci_build
  puts 'Building the site...'
  build
  exec_cmd('bash deploy/test.sh')
  puts 'Done!'
end

def server_build
  puts 'Stashing (just in case)'
  exec_cmd 'git stash'
  puts 'Pulling from git'
  exec_cmd 'git pull'
  update_gems
  puts 'building site'
  exec_cmd('bundle exec jekyll b --config _config.yml')
  require 'time'
  puts Time.now()
end

def production_build
  puts 'Stashing (justin case)'
  exec_cmd 'git stash'
  puts 'Pulling from git'
  exec_cmd 'git pull'
  update_gems
  puts 'building site'
  exec_cmd('bundle exec jekyll b --config _config.yml,_config-deploy.yml')
  require 'time'
  puts Time.now()
end

def cf_deploy
  build
  exec_cmd('sh deploy/cf-deploy.sh')
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
  :production_build => 'Deploys to production using a second config file'
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
