require_relative 'filters'

module JekyllPagesApi
  # wrapper for a Jekyll::Page
  class Page
    HTML_EXTS = %w(.html .md .markdown .textile).to_set
    attr_reader :page, :site

    # Jekyll::StaticFile doesn't expose a `site` accessor, so we require an
    # explicit `site` argument here.
    def initialize(page, site)
      @page = page
      @site = site
    end

    def html?
      path = self.page.path
      path.end_with?('/') || HTML_EXTS.include?(File.extname(path))
    end

    def filterer
      @filterer ||= Filters.new
    end

    def title
      title = self.page.data['title'] if self.page.respond_to?(:data)
      title ||= self.page.title if self.page.respond_to?(:title)
      self.filterer.decode_html(title || '')
    end

    def base_url
      self.site.baseurl
    end

    def rel_path
      path = self.page.url if self.page.respond_to?(:url)
      path ||= self.page.relative_path if self.page.respond_to?(:relative_path)
      path
    end

    def url
      [self.base_url, rel_path].join
    end

    def body_text
      output = self.page.content if self.page.respond_to?(:content)
      output ||= File.read(self.page.path)
      self.filterer.text_only(output)
    end

    def tags
      (self.page.data['tags'] if self.page.respond_to?(:data)) || []
    end

    def skip_index?
      (self.page.data['skip_index'] if self.page.respond_to?(:data)) || false
    end

    def to_json
      optional = {}
      optional['skip_index'] = true if self.skip_index?
      optional.merge({
        title: self.title,
        url: self.url,
        tags: self.tags,
        body: self.body_text
      })
    end
  end
end
