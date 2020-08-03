# encoding: UTF-8

require_relative "helper"


describe "when handling requests" do

  before do
    @tempdir = File.join(TEST_DIR, "tmp")
    FileUtils.mkdir_p(@tempdir)  unless File.exist?(@tempdir)
    Dir.chdir(@tempdir)

    @sourcedir = File.join(TEST_DIR, "source")
    @destdir   = File.join(@tempdir, "_site")
    FileUtils.mkdir_p(@sourcedir)  unless File.exist?(@sourcedir)
    FileUtils.mkdir_p(@destdir)    unless File.exist?(@destdir)

    @jekyll = rack_jekyll(:force_build => true,
                          :source      => @sourcedir,
                          :destination => @destdir)
    @request = Rack::MockRequest.new(@jekyll)
  end

  after do
    FileUtils.rm_rf(@tempdir)  if File.exist?(@tempdir)
  end

  it "can be created" do
    @jekyll.wont_be_nil
    @request.wont_be_nil
  end

  it "should return status 200 for existing path" do
    @request.get("/").status.must_equal 200
    @request.get("/2015/10/05/hello-world.html").status.must_equal 200
  end

  it "should return status 404 for nonexistent path" do
    @request.get("/show/me/404").status.must_equal 404
  end

  it "should return status 404 for partially matching path 1" do
    @request.get("/2015/10/05/hello").status.must_equal 404
  end

  it "should return status 404 for partially matching path 2" do
    @request.get("/10/05/hello-world.html").status.must_equal 404
  end

  it "should return correct status code for If-Modified-Since" do
    modify_time = @request.get("/").headers["Last-Modified"]
    earlier_time = (Time.parse(modify_time) - 3600).httpdate

    @request.get("/", {"HTTP_IF_MODIFIED_SINCE" => modify_time}).status.must_equal 304
    @request.get("/", {"HTTP_IF_MODIFIED_SINCE" => earlier_time}).status.must_equal 200
  end

  it "should return correct status code for If-Modified-Since with 404s" do
    modify_time = @request.get("/").headers["Last-Modified"]
    earlier_time = (Time.parse(modify_time) - 3600).httpdate

    @request.get("/show/me/404", {"HTTP_IF_MODIFIED_SINCE" => earlier_time}).status.must_equal 404
  end

  it "should return correct Content-Type header" do
    @request.get("/").headers["Content-Type"].must_equal "text/html"
    @request.get("/css/test.css").headers["Content-Type"].must_equal "text/css"
    @request.get("/js/test.js").headers["Content-Type"].must_equal "application/javascript"
    @request.get("/js/test.min.js").headers["Content-Type"].must_equal "application/javascript"
    @request.get("/show/me/404").headers["Content-Type"].must_equal "text/html"
  end

  it "should return correct Content-Length header for '/'" do
    @request.get("/").original_headers["Content-Length"].to_i.must_equal 24
  end

  it "should return correct Content-Length header for If-Modified-Since" do
    modify_time = @request.get("/").headers["Last-Modified"]
    @request.get("/", {"HTTP_IF_MODIFIED_SINCE" => modify_time}).original_headers["Content-Length"].must_be_nil
  end

  it "should return correct body for '/'" do
    @request.get("/").body.must_equal "<p>Rack-Jekyll Test</p>\n"
  end


  describe "when the site is compiling" do

    it "should serve a wait page" do
      begin
        filename = File.join(@sourcedir, "custom_wait.html")
        File.open(filename, "w") {|f| f.puts "Custom Wait" }

        jekyll = nil
        silence_output do
          # This is a little brittle as the site renders in a separate thread
          # Theoretically, if the site rendered fast enough, the request
          # would end up getting actual content instead of the wait page
          # and this test would fail.
          jekyll = Rack::Jekyll.new(:force_build => true,
                                    :source      => @sourcedir,
                                    :destination => @destdir,
                                    :wait_page   => filename)
        end
        request = Rack::MockRequest.new(jekyll)

        request.get("/index.html").body.must_match %r{Custom Wait}
      ensure
        FileUtils.rm(filename)
      end
    end
  end


  describe "when a directory is requested" do

    it "should redirect with status 301 to 'directory/' for 'directory' with index.html" do
      skip
      @request.get("/dir-with-index").status.must_equal 301
      @request.get("/dir-with-index").headers["Location"].must_equal "/dir-with-index/"
    end

    it "should return status 200 for 'directory/' with index.html" do
      @request.get("/dir-with-index/").status.must_equal 200
    end

    it "should return status 404 for 'directory' without index.html" do
      @request.get("/dir-without-index").status.must_equal 404
    end

    it "should return status 404 for 'directory/' without index.html" do
      @request.get("/dir-without-index/").status.must_equal 404
    end
  end


  describe "when a resource of unknown mime type is requested" do

    it "should return status 200" do
      @request.get("/no-extension").status.must_equal 200
    end

    it "should return Content-Type 'application/octet-stream'" do
      @request.get("/no-extension").headers["Content-Type"].must_equal "application/octet-stream"
    end
  end


  describe "when page contains multibyte characters" do

    before do
      @response = @request.get("/buenos_dias.html")
    end

    it "should return correct body" do
      @response.body.must_equal "<p>¡Buenos días!</p>\n"
    end

    it "should return the bytesize as Content-Length header" do
      @response.original_headers["Content-Length"].to_i.must_equal 23
    end
  end


  describe "when returning 404s" do

    it "should return correct body for default 404" do
      @request.get("/show/me/404").body.must_equal "Not found"
    end

    it "should return correct Content-Length header for default 404" do
      @request.get("/show/me/404").original_headers["Content-Length"].to_i.must_equal 9
    end

    it "should return correct body for custom 404" do
      begin
        filename = File.join(@sourcedir, "404.html")
        File.open(filename, "w") {|f| f.puts "Custom 404" }

        jekyll = rack_jekyll(:force_build => true,
                             :source      => @sourcedir,
                             :destination => @destdir)
        request = Rack::MockRequest.new(jekyll)

        request.get("/show/me/404").body.must_match %r{Custom 404}
      ensure
        FileUtils.rm(filename)
      end
    end
  end


  describe "when handling HEAD requests" do

    it "should return status 200 for '/'" do
      @request.head("/").status.must_equal 200
    end

    it "should return correct Content-Length header for '/'" do
      @request.head("/").original_headers["Content-Length"].to_i.must_equal 24
    end

    it "should not return a body" do
      @request.head("/").body.must_equal ""
    end
  end
end
