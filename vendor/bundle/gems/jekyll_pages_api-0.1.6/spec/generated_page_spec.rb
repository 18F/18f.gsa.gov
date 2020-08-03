module JekyllPagesApi
  describe GeneratedPage do
    describe '#initialize' do
      it "handles all empty strings correctly" do
        page = GeneratedPage.new "", "", "", "", ""
        expect(page.path).to eq("")
        expect(page.relative_path).to eq("")
        expect(page.data).to eq({})
        expect(page.content).to eq("")
      end

      it "parses the relative path when basedir ends in SEPARATOR" do
        path = File.join "foo", "bar", "baz.html"
        basedir = File.join "foo", ""
        page = GeneratedPage.new path, basedir, "", "", ""
        expect(page.path).to eq("foo/bar/baz.html")
        expect(page.relative_path).to eq("/bar/baz.html")
        expect(page.data).to eq({})
        expect(page.content).to eq("")
      end

      it "parses the relative path when basedir doesn't end in SEPARATOR" do
        path = File.join "foo", "bar", "baz.html"
        basedir = "foo"
        page = GeneratedPage.new path, basedir, "", "", ""
        expect(page.path).to eq("foo/bar/baz.html")
        expect(page.relative_path).to eq("/bar/baz.html")
        expect(page.data).to eq({})
        expect(page.content).to eq("")
      end

      it "raises RuntimeError when path does not begin with basedir" do
        path = File.join "foo", "bar", "baz.html"
        basedir = File.join "quux", ""
        expect{GeneratedPage.new path, basedir, "", "", ""
          }.to raise_error(
            RuntimeError, "#{path} does not start with #{basedir}")
      end

      it "parses out index.html suffix and leaves trailing slash" do
        path = File.join "foo", "bar", "index.html"
        basedir = File.join "foo", ""
        page = GeneratedPage.new path, basedir, "", "", ""
        expect(page.path).to eq("foo/bar/index.html")
        expect(page.relative_path).to eq("/bar/")
        expect(page.data).to eq({})
        expect(page.content).to eq("")
      end

      it "parses out index.html suffix and leaves trailing slash for root" do
        path = File.join "foo", "index.html"
        basedir = File.join "foo", ""
        page = GeneratedPage.new path, basedir, "", "", ""
        expect(page.path).to eq("foo/index.html")
        expect(page.relative_path).to eq("/")
        expect(page.data).to eq({})
        expect(page.content).to eq("")
      end

      it "parses content correctly" do
        path = File.join "foo", "bar", "index.html"
        basedir = File.join "foo", ""
        title_prefix = "18F &mdash; "
        body_element_tag = "<div class='content'"
        content = "<head><title>18F &mdash; Blah Blah Woof Woof</title>"+
          "<meta name='skip-index' content='true'>"+
          "<meta content='baz,quux,xyzzy,plugh' name=\"tags\" />"+
          "</head>"+
          "<body><div>header</div>"+
          "<div class='content'>foobar</div>"+
          "<div>footer</div></body>"

        page = GeneratedPage.new(path, basedir, title_prefix,
          body_element_tag, content)
        expect(page.path).to eq("foo/bar/index.html")
        expect(page.relative_path).to eq("/bar/")
        expect(page.data).to eq(
          "title" => "Blah Blah Woof Woof",
          "skip-index" => "true",
          "tags" => "baz,quux,xyzzy,plugh",
        )
        expect(page.content).to eq("foobar")
      end
    end
  end
end
