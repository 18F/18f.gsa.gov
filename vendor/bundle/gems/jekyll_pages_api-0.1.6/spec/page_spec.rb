require_relative 'support/create_page'

BASEURL = Jekyll::Configuration::DEFAULTS['baseurl']

describe JekyllPagesApi::Page do
  include_context "create page"

  describe '#url' do
    it "returns the path" do
      expect(create_page(BASEURL, '/foo/').url).to eq('/foo/')
    end

    it "prepends the baseurl" do
      expect(create_page('/base', '/foo/').url).to eq('/base/foo/')
    end

    it "uses the relative path for StaticFiles" do
      page = create_static_file('/base', '/foo.html')
      expect(page.url).to eq('/base/foo.html')
    end

    it "uses the relative path for Documents" do
      expect(create_document('/base', '/foo.html').url).to eq('/base/foo.html')
    end
  end

  describe '#html?' do
    it "returns true for paths ending in slash" do
      expect(create_page(BASEURL, '/foo/').html?).to eq(true)
    end

    it "returns true for paths ending in .html" do
      expect(create_page(BASEURL, '/foo/index.html').html?).to eq(true)
    end

    it "returns true for paths ending in .md" do
      expect(create_page(BASEURL, '/foo/index.html').html?).to eq(true)
    end

    it "returns false otherwise" do
      expect(create_page(BASEURL, '/foo/index.json').html?).to eq(false)
    end
  end

  describe '#title' do
    it "returns the title field from the page's front matter if present" do
      page = create_page(BASEURL, '/foo/', data:{'title' => 'Foo'})
      expect(page.title).to eq('Foo')
    end

    it "returns the title field from the post's front matter if present" do
      page = create_post(BASEURL, '/foo/', data:{'title' => 'Foo'})
      expect(page.title).to eq('Foo')
    end

    it "returns the title method from post method if not in front matter" do
      page = create_post(BASEURL, '/foo/', title: 'Foo')
      expect(page.title).to eq('Foo')
    end

    it "returns the empty string for StaticFiles" do
      expect(create_static_file(BASEURL, '/foo/').title).to eq('')
    end

    it "returns the title field from the document's front matter if present" do
      page = create_document(BASEURL, '/foo/', data:{'title' => 'Foo'})
      expect(page.title).to eq('Foo')
    end

    it "returns the empty string for Documents if not in front matter" do
      expect(create_document(BASEURL, '/foo/').title).to eq('')
    end
  end

  describe "#tags" do
    it "returns tags if present in the front matter" do
      page = create_page(BASEURL, '/foo/',
        data:{'tags' => ['foo', 'bar', 'baz']})
      expect(page.tags).to eq(['foo', 'bar', 'baz'])
    end

    it "returns the empty list if not present in the front matter" do
      expect(create_page(BASEURL, '/foo/').tags).to eq([])
    end

    it "returns the empty list if the page does not contain front matter" do
      expect(create_static_file(BASEURL, '/foo/').tags).to eq([])
    end
  end

  describe "#body_text" do
    it "returns the content if present" do
      page = create_page(BASEURL, '/foo/', content: "foo bar baz")
      expect(page.body_text).to eq("foo bar baz")
    end

    it "returns the file content of StaticFiles" do
      page = create_static_file(BASEURL, '/foo.html', content: "foo bar baz")
      expect(page.body_text).to eq("foo bar baz")
    end
  end

  describe "#skip_index?" do
    it "defaults to false if the 'data' member isn't present" do
      expect(create_static_file(BASEURL, '/foo/').skip_index?).to eq(false)
    end

    it "defaults to false if the 'skip_index' field isn't present" do
      expect(create_page(BASEURL, '/foo/').skip_index?).to eq(false)
    end

    it "returns true if data['skip_index'] is true" do
      page = create_page(BASEURL, '/foo/', data:{'skip_index' => true})
      expect(page.skip_index?).to eq(true)
    end
  end
end
