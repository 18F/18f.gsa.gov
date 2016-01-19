#!/usr/bin/env ruby

require 'html/proofer'
proofer = HTML::Proofer.new("./_site", {
  :directory_index_file => "index.html",
  :url_ignore => ["/dashboard","/feed/","18f@gsa.gov"],
  :disable_external => true,
  :href_swap => {"%20" => " "}
})
proofer.run
