require 'fileutils'
require 'tmpdir'

module JekyllPagesApi
  describe GeneratedPage do
    describe '#each_site_file' do
      before :each do
        @test_tmpdir = Dir.mktmpdir
      end

      after :each do
        FileUtils.remove_entry @test_tmpdir
      end

      it "should only select .html files containing a title" do
        basedir = File.join @test_tmpdir, "foo"
        FileUtils.mkdir_p basedir

        content_dir = File.join(basedir, "bar")
        FileUtils.mkdir_p content_dir

        File.open(File.join(content_dir, "baz.txt"), "w") do |f|
          f << "Text file that should be excluded."
        end

        File.open(File.join(content_dir, "quux.html"), "w") do |f|
          f << "<html><head><title>18F &mdash; Include me!</title></head>"
          f << "<body><div>header</div>"
          f << "<div class='content'>This page should be included.</div>"
          f << "<div>footer</div></body></html>"
        end

        File.open(File.join(content_dir, "xyzzy.html"), "w") do |f|
          f << "<html><head></head><body>"
          f << "This page shouldn't be included because it lacks a title."
          f << "</body></html>"
        end

        paths = ['baz.txt', 'quux.html', 'xyzzy.html'].sort.map do |f|
          File.join content_dir, f
        end
        expect(Dir.glob(File.join(content_dir, '**', '*'))).to eq(paths)

        site = GeneratedSite.new("https://unused/", basedir,
          "18F &mdash; ", "<div class='content'")
        pages = []
        site.each_site_file {|f| pages << f}
        expect(pages.size).to eq(1)

        page = pages.first
        expect(page.path).to eq(File.join content_dir, 'quux.html')
        expect(page.relative_path).to eq("/bar/quux.html")
        expect(page.data).to eq("title" => "Include me!")
        expect(page.content).to eq("This page should be included.")
      end
    end
  end
end
