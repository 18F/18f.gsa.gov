require_relative "helper"


describe Rack::Jekyll::FileHandler do

  describe "when asked for filenames with #get_filename" do

    before do
      files = [
        "/site/index.html",
        "/site/page.html",
        "/site/README",
        "/site/dir-with-index/index.html",
        "/site/dir-without-index/page.html",
        "/site/dir1/dir2/dir3/index.html"
      ]
      @filehandler = Rack::Jekyll::FileHandler.new("/site", files)
    end

    it "should return path for '/'" do
      @filehandler.get_filename("/").must_equal "/site/index.html"
    end

    it "should return existing path" do
      @filehandler.get_filename("/page.html").must_equal "/site/page.html"
    end

    it "should return nil for non-existent path" do
      @filehandler.get_filename("/not-a-page.html").must_be_nil
    end

    it "should return existing path for resource without extension" do
      @filehandler.get_filename("/README").must_equal "/site/README"
    end

    it "should return nil for partially matching paths" do
      @filehandler.get_filename("/dir1/dir2/").must_be_nil
      @filehandler.get_filename("/dir2/dir3").must_be_nil
      @filehandler.get_filename("ir1/di").must_be_nil
    end

    it "should return path for directory/ with index" do
      @filehandler.get_filename("/dir-with-index/").must_equal "/site/dir-with-index/index.html"
    end

    it "should return path for directory with index" do
      @filehandler.get_filename("/dir-with-index").must_equal "/site/dir-with-index/index.html"
    end

    it "should return nil for directory/ without index" do
      @filehandler.get_filename("/dir-without-index/").must_be_nil
    end

    it "should return nil for directory without index" do
      @filehandler.get_filename("/dir-without-index").must_be_nil
    end
  end


  describe "when retrieving the file list from root directory" do

    before do
      sourcedir = File.join(TEST_DIR, "source")
      @filehandler = Rack::Jekyll::FileHandler.new(sourcedir)
      @existing_file = File.join(sourcedir, "index.md")
      @existing_dir  = File.join(sourcedir, "css")
    end

    it "should include regular files" do
      @filehandler.files.must_include @existing_file
    end

    it "should not include directories" do
      @filehandler.files.wont_include @existing_dir
    end
  end


  describe "when initialized" do

    it "should strip trailing slash from root" do
      filehandler = Rack::Jekyll::FileHandler.new("/site/", [])
      filehandler.root.must_equal "/site"
    end

    it "should not append a trailing slash to root" do
      filehandler = Rack::Jekyll::FileHandler.new("/site", [])
      filehandler.root.must_equal "/site"
    end
  end
end
