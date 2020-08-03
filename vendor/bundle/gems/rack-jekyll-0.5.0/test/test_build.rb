require_relative "helper"


describe "when initializing a Rack::Jekyll instance" do

  before do
    @tempdir = File.join(TEST_DIR, "tmp")
    FileUtils.mkdir_p(@tempdir)  unless File.exist?(@tempdir)
    Dir.chdir(@tempdir)

    @sourcedir = File.join(TEST_DIR, "source")
    @destdir   = File.join(@tempdir, "_site")
    FileUtils.mkdir_p(@sourcedir)  unless File.exist?(@sourcedir)
    FileUtils.mkdir_p(@destdir)    unless File.exist?(@destdir)

    @page      = File.join(@destdir, "index.html")
    @fake_page = File.join(@destdir, "fake.html")
  end

  after do
    FileUtils.rm_rf(@tempdir)  if File.exist?(@tempdir)
  end

  describe "when non-empty destination directory exists" do

    before do
      FileUtils.touch(@fake_page)
    end

    it "should not build the site by default" do
      file_wont_exist(@page)
      rack_jekyll(:source      => @sourcedir,
                  :destination => @destdir)
      file_wont_exist(@page)
    end

    it "should build the site when :force_build option is set" do
      file_wont_exist(@page)
      rack_jekyll(:force_build => true,
                  :source      => @sourcedir,
                  :destination => @destdir)
      file_must_exist(@page)
    end
  end

  describe "when empty destination directory exists" do

    it "should build the site" do
      file_wont_exist(@page)
      rack_jekyll(:source      => @sourcedir,
                  :destination => @destdir)
      file_must_exist(@page)
    end
  end
end
