# @author Mike Bland (michael.bland@gsa.gov)

require_relative 'generated_page'

module JekyllPagesApi
  # Used by the standalone executable to mimic a Jekyll::Site when processing
  # an already-generated site using the Generator.
  class GeneratedSite
    # @see #initialize
    attr_reader :baseurl, :basedir, :title_prefix, :body_element_tag

    # @return [Array<>] a dummy empty Array
    attr_accessor :pages

    # @param baseurl [String] URL prefix of every page of the generated site
    # @param basedir [String] Path to the generated site's root directory
    # @param title_prefix [String] Prefix to strip from page titles
    # @param body_element_tag [String] Tag (or tag prefix) identifying the
    #   main content element within the <body> element of each document. Can
    #   be a complete tag (ending in '>'), or the prefix of a longer tag. Used
    #   to strip boilerplate out of the content exported via the API.
    def initialize(baseurl, basedir, title_prefix, body_element_tag)
      @baseurl = baseurl
      @basedir = basedir
      @title_prefix = title_prefix
      @body_element_tag = body_element_tag
      @pages = []
    end

    # Generator yielding each HTML page (as a {GeneratedPage}) that should be
    # exported via the API.
    def each_site_file
      Dir.glob(File.join(self.basedir, '**', '*')) do |f|
        next unless f.end_with? '.html'
        begin
          page = GeneratedPage.new(f, self.basedir, self.title_prefix,
            self.body_element_tag, File.read(f))
          yield page unless page.data['title'].nil?
        rescue
          $stderr.puts "Error while processing #{f}:"
          raise
        end
      end
    end
  end
end
