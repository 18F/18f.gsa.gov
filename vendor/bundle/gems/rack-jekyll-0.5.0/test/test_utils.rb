require_relative "helper"


describe Rack::Jekyll::Utils do

  before do
    @utils = Rack::Jekyll::Utils
  end


  describe "when asked for #media_type" do

    it "returns correct type for HTML" do
      @utils.media_type("index.html").must_equal "text/html"
    end

    it "returns correct type for HTML with full path" do
      @utils.media_type("/path/index.html").must_equal "text/html"
    end

    it "returns correct type for CSS" do
      @utils.media_type("/path/style.css").must_equal "text/css"
    end

    it "returns correct type for *.min.js" do
      @utils.media_type("script.min.js").must_equal "application/javascript"
    end

    it "returns correct default type for files without extension" do
      @utils.media_type("README").must_equal "application/octet-stream"
    end

    it "ignores lower/upper case in file extensions" do
      @utils.media_type("image.JpG").must_equal "image/jpeg"
    end
  end


  describe "when asked for #file_info" do

    before do
      @filename = __FILE__
      @info = @utils.file_info(@filename)
    end

    it "has the file content" do
      @info[:body].must_equal ::File.read(@filename)
    end

    it "has the modification time in httpdate format" do
      @info[:time].must_equal ::File.mtime(@filename).httpdate
    end
  end
end
