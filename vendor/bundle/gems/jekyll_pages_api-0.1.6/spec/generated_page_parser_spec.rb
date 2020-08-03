module JekyllPagesApi
  describe GeneratedPageParser do
    describe '#parse_basic_tag' do
      it "returns nil if content is empty" do
        expect(GeneratedPageParser.parse_basic_tag('', '')).to eq(nil)
      end

      it "returns nil if the tag is not present" do
        expect(GeneratedPageParser.parse_basic_tag(
          'title', 'foobar')).to eq(nil)
      end

      it "returns nil if the tag is not closed" do
        expect(GeneratedPageParser.parse_basic_tag(
          'title', '<title>foobar')).to eq(nil)
      end

      it "returns the content of the tag" do
        expect(GeneratedPageParser.parse_basic_tag(
          'title', '<title>foobar</title>')).to eq('foobar')
      end
    end

    describe '#parse_meta_tags' do
      it "returns an empty hash if the head_element is empty" do
        expect(GeneratedPageParser.parse_meta_tags('')).to eq({})
      end

      it "returns an empty hash if a meta tag isn't closed properly" do
        expect(GeneratedPageParser.parse_meta_tags(
          '<meta name="foo" content="bar"')).to eq({})
      end

      it "returns an empty hash if the only meta tag lacks a name" do
        expect(GeneratedPageParser.parse_meta_tags(
          '<meta not_a_name="foo" content="bar">')).to eq({})
      end

      it "returns a valid hash for a well-formed meta tag" do
        expect(GeneratedPageParser.parse_meta_tags(
          '<meta name="foo" content="bar">')).to eq("foo" => "bar")
      end

      it "returns a valid hash for a self-closing meta tag" do
        expect(GeneratedPageParser.parse_meta_tags(
          '<meta name="foo" content="bar"/>')).to eq("foo" => "bar")
      end

      it "returns a valid hash for a meta tag with single-quote delimiters" do
        expect(GeneratedPageParser.parse_meta_tags(
          "<meta name='foo' content='bar'/>")).to eq("foo" => "bar")
      end

      it "returns a valid hash for a meta tag with mixed-quote delimiters" do
        expect(GeneratedPageParser.parse_meta_tags(
          "<meta name='foo' content=\"bar\"/>")).to eq("foo" => "bar")
      end

      it "returns a valid hash regardless of attribute order" do
        expect(GeneratedPageParser.parse_meta_tags(
          '<meta content="bar" name="foo" />')).to eq("foo" => "bar")
      end

      it "returns a valid hash for multiple meta tags" do
        expect(GeneratedPageParser.parse_meta_tags(
          '<meta name="foo" content="bar"/>'+
          "<meta name='baz' content='quux' other=\"don't care\" >" +
          '<meta content="plugh" name="xyzzy" />')
          ).to eq("foo" => "bar", "baz" => "quux", "xyzzy" => "plugh")
      end
    end

    describe '#parse_content_from_body' do
      it "returns the empty string if passed all empty strings" do
        expect(GeneratedPageParser.parse_content_from_body("", "")).to eq("")
      end

      it "returns the original content if there are no body tags" do
        expect(GeneratedPageParser.parse_content_from_body(
          "foobar", "")).to eq("foobar")
      end

      it "returns the original content if the body tag isn't closed" do
        expect(GeneratedPageParser.parse_content_from_body(
          "<body>foobar", "")).to eq("<body>foobar")
      end

      it "returns the full body content if the body_element_tag is empty" do
        expect(GeneratedPageParser.parse_content_from_body(
          "<body>header<div class='content'>foobar</div>footer</body>", "")
          ).to eq("header<div class='content'>foobar</div>footer")
      end

      it "returns only the body content within the body_element_tag" do
        expect(GeneratedPageParser.parse_content_from_body(
          "<body><div>header</div>"+
          "<div class='content'>foobar</div>"+
          "<div>footer</div></body>",
          "<div class='content'>")).to eq("foobar")
      end

      it "returns only the body content when body_element_tag is a prefix" do
        expect(GeneratedPageParser.parse_content_from_body(
          "<body><div>header</div>"+
          "<div class='content' plus='blah blah woof woof'>foobar</div>"+
          "<div>footer</div></body>",
          "<div class='content'")).to eq("foobar")
      end

      it "handles nested divs within the body content" do
        expect(GeneratedPageParser.parse_content_from_body(
          "<body><div>header</div>"+
          "<div class='content' plus='blah blah woof woof'>"+
          "blah blah"+
          "<div>plus<div>some</div><div>nested</div>divs</div>"+
          "woof woof"+
          "</div>"+
          "<div>footer</div></body>",
          "<div class='content'")
        ).to eq(
          "blah blah"+
          "<div>plus<div>some</div><div>nested</div>divs</div>"+
          "woof woof"
        )
      end
    end

    describe '#parse_generated_page' do
      it "returns empty values when passed all empty strings" do
        data, content = GeneratedPageParser.parse_generated_page "", "", ""
        expect(data).to eq({})
        expect(content).to eq("")
      end

      it "returns empty values when the head element isn't present" do
        data, content = GeneratedPageParser.parse_generated_page(
          "<body>foobar</body>", "", "")
        expect(data).to eq({})
        expect(content).to eq("")
      end

      it "returns a nil title and all body content" do
        data, content = GeneratedPageParser.parse_generated_page(
          "<head></head>"+
          "<body><div>header</div>"+
          "<div class='content'>foobar</div>"+
          "<div>footer</div></body>", "", "")
        expect(data).to eq({"title" => nil})
        expect(content).to eq(
          "<div>header</div><div class='content'>foobar</div><div>footer</div>")
      end

      it "returns the title and only body content within body_element_tag" do
        data, content = GeneratedPageParser.parse_generated_page(
          "<head><title>Blah Blah Woof Woof</title></head>"+
          "<body><div>header</div>"+
          "<div class='content'>foobar</div>"+
          "<div>footer</div></body>", "", "<div class='content'")
        expect(data).to eq({"title" => "Blah Blah Woof Woof"})
        expect(content).to eq("foobar")
      end

      it "returns the stripped title body content and metadata" do
        data, content = GeneratedPageParser.parse_generated_page(
          "<head><title>18F &mdash; Blah Blah Woof Woof</title>"+
          "<meta name='skip-index' content='true'>"+
          "<meta content='baz,quux,xyzzy,plugh' name=\"tags\" />"+
          "</head>"+
          "<body><div>header</div>"+
          "<div class='content'>foobar</div>"+
          "<div>footer</div></body>", "18F &mdash; ", "<div class='content'")
        expect(data).to eq(
          "title" => "Blah Blah Woof Woof",
          "skip-index" => "true",
          "tags" => "baz,quux,xyzzy,plugh",
        )
        expect(content).to eq("foobar")
      end
    end
  end
end
