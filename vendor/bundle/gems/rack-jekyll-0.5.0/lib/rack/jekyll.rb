require "rack"
require "jekyll"
require "thread"

require_relative "jekyll/filehandler"
require_relative "jekyll/utils"
require_relative "jekyll/version"

module Rack
  class Jekyll

    attr_reader :config, :destination, :wait_page

    # Initializes a new Rack::Jekyll site.
    #
    # Options:
    #
    # +:config+::      use given config file (default: "_config.yml")
    #
    # +:force_build+:: whether to always generate the site at startup, even
    #                  when the destination path is not empty (default: +false+)
    #
    # +:auto+::        whether to watch for changes and rebuild (default: +false+)
    #
    # +:wait_page+::   a page to display while pages are rendering (default: "templates/wait.html")
    #
    # Other options are passed on to Jekyll::Site.
    def initialize(options = {})
      overrides = options.dup
      @force_build = overrides.fetch(:force_build, false)
      @auto        = overrides.fetch(:auto, false)
      @wait_page   = read_wait_page(overrides)
      @compile_queue = Queue.new

      overrides.delete(:force_build)
      overrides.delete(:auto)
      overrides.delete(:wait_page)
      @config = ::Jekyll.configuration(overrides)

      @destination = @config["destination"]
      @source      = @config["source"]

      @files = FileHandler.new(@destination)
      @site = ::Jekyll::Site.new(@config)

      if @files.empty? || @force_build
        process("Generating site: #{@source} -> #{@destination}")
      end

      if @auto
        require 'listen'
        require 'listen/version'
        require 'pathname'

        puts "Auto-regeneration enabled: #{@source} -> #{@destination}"

        source_abs = ::File.expand_path(@source)
        dest_abs   = ::File.expand_path(@destination)
        relative_path_to_dest = Pathname.new(dest_abs)
                                .relative_path_from(Pathname.new(source_abs))
                                .to_path
        ignore_pattern = %r{#{Regexp.escape(relative_path_to_dest)}}

        listener = Listen.to(@source, :ignore => ignore_pattern) do |modified, added, removed|
          unless compiling?
            t = Time.now.strftime("%Y-%m-%d %H:%M:%S")
            n = modified.length + added.length + removed.length
            process("[#{t}] Regenerating: #{n} file(s) changed")
          end
        end
        listener.start  unless Listen::VERSION =~ /\A[0-1]\./
      end
    end

    def call(env)
      request = Rack::Request.new(env)

      while compiling?
        return serve_wait_page(request)
      end

      filename = @files.get_filename(request.path_info)

      if filename
        media_type = Utils.media_type(filename)

        file = Utils.file_info(filename)
        body = file[:body]
        time = file[:time]
        hdrs = { "Last-Modified" => time }

        if time == request.env["HTTP_IF_MODIFIED_SINCE"]
          response = [304, hdrs, []]
        else
          hdrs.update({ "Content-Length" => body.bytesize.to_s,
                        "Content-Type"   => media_type })
          response = [200, hdrs, [body]]
        end

      else
        body = not_found_message
        hdrs = { "Content-Length" => body.bytesize.to_s,
                 "Content-Type"   => "text/html" }
        response = [404, hdrs, [body]]
      end

      request.head? ? remove_body(response) : response
    end

    def compiling?
      !@compile_queue.empty?
    end

    private

    def process(message = nil)
      puts message if message
      @compile_queue << '.'

      Thread.new do
        @site.process
        @files.update
        @compile_queue.clear
      end
    end

    def not_found_message
      custom_404 || default_404
    end

    def default_404
      "Not found"
    end

    def custom_404
      filename = @files.get_filename("/404.html")

      filename ? Utils.file_info(filename)[:body] : nil
    end

    def read_wait_page(options)
      path = ::File.expand_path("templates/wait.html", ::File.dirname(__FILE__))
      if options.key?(:wait_page)
        if ::File.exist?(options[:wait_page])
          path = options[:wait_page]
        else
          puts "Could not read #{options[:wait_page]}.  Using default."
        end
      end
      ::File.open(path, 'r').read
    end

    def serve_wait_page(req)
      headers ||= {}
      headers['Content-Length'] = @wait_page.bytesize.to_s
      headers['Content-Type'] = 'text/html'
      headers['Connection'] = 'keep-alive'
      [200, headers, [@wait_page]]
    end

    def remove_body(response)
      status, headers, _body = response

      [status, headers, []]
    end
  end
end
