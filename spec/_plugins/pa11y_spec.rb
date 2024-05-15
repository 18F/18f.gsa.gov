require_relative '../../_plugins/pa11y'

RSpec.describe Document do

  let(:blog_path) { "_posts/2024-04-10-working-with-oracle-databases.md" }
  let(:blog_layout) { "post" }
  let(:blog_layout_path) { "_layouts/post.html" }

  # Stand-in for file diffing (GitDiffer), so tests don't rely on
  # git history.
  class TestDiffer
    attr_reader :changed_files

    def initialize(*paths)
      @changed_files = *paths
    end
  end

  # @example Use the convenience method
  #   TestDiffer("_layouts/default.html", "_posts/2024-04-10-new-post.md")
  def TestDiffer(*paths)
    TestDiffer.new(*paths)
  end

  describe "#to_scan?" do
    context "source files" do
      let(:document) {
        Document.new(blog_path, blog_layout, test_differ)
      }

      context "with a matching changed source file" do
        let(:test_differ) { TestDiffer(blog_path) }
        it "returns true" do
          expect(document.to_scan?).to be true
        end
      end

      context "without a matching changed source file" do
        let(:test_differ) { TestDiffer() }
        it "returns false" do
          expect(document.to_scan?).to be false
        end
      end

      context "with a matching changed layout file" do
        let(:test_differ) { TestDiffer(blog_layout_path) }
        it "returns true" do
          expect(document.to_scan?).to be true
        end
      end

      context "without a matching changed layout file" do
        let(:test_differ) { TestDiffer() }
        it "returns false" do
          expect(document.to_scan?).to be false
        end
      end

      context "with a matching changed source file and changed layout file" do
        let(:test_differ) { TestDiffer(blog_path, blog_layout_path) }
        it "returns true" do
          expect(document.to_scan?).to be true
        end
      end
    end
  end

end


RSpec.describe SiteSampler do

  describe "#folders" do
    context "with no site files or permalinks" do
      let(:collector) { SiteSampler.new({}, [], []) }
      it "lists no pages" do
        expect(collector.pages.count).to eq(0)
      end
    end

    context "with site files and permalinks" do
      let(:site_files) { ["_site/blog/index.html", "_site/blog/page/2/index.html"] }
      let(:permalinks) { ["blog/page/:num/", "blog/"] }
      let(:collector) { SiteSampler.new({}, site_files, permalinks) }
      it "lists pages" do
        expect(collector.pages.count).to eq(2)
      end
    end
    
    context "with HTML and PDF files" do
      let(:site_files) { ["_site/blog/index.html", "_site/blog/page/2/index.html", "_site/partnership-principles/18FPartnershipPrinciples.pdf"] }
      let(:permalinks) { ["blog/page/:num/", "blog/"] }
      let(:collector) { SiteSampler.new({}, site_files, permalinks) }
      it "ignores PDF files" do
        expect(collector.pages.count).to eq(2)
      end
    end

  end
end
