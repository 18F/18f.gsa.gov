require 'tmpdir'

RSpec.shared_context "create page" do
  before { @tmp_dir = nil }
  after { FileUtils.remove_entry(@tmp_dir) if @tmp_dir }

  def create_page(baseurl, page_url, data: nil, content: nil)
    site = instance_double(Jekyll::Site, baseurl: baseurl)
    jekyll_page = instance_double(Jekyll::Page, site: site, url: page_url,
      path: page_url)
    allow(jekyll_page).to receive(:data).and_return(data) unless data.nil?
    unless content.nil?
      allow(jekyll_page).to receive(:content).and_return(content)
    end
    JekyllPagesApi::Page.new(jekyll_page, site)
  end

  def create_static_file(baseurl, relative_path, content: nil)
    site = instance_double(Jekyll::Site, baseurl: baseurl)
    if content.nil?
      jekyll_static_file = instance_double(Jekyll::StaticFile,
        relative_path: relative_path)
    else content.nil?
      @tmp_root = Dir.mktmpdir
      @static_file_path = File.join(@tmp_root, relative_path)
      FileUtils.mkdir_p(File.dirname(@static_file_path))
      File.open(@static_file_path, 'w') {|f| f << content}

      jekyll_static_file = Jekyll::StaticFile.new(site, @tmp_root,
        File.dirname(relative_path), File.basename(relative_path))
    end
    JekyllPagesApi::Page.new(jekyll_static_file, site)
  end

  def create_post(baseurl, page_url, data: nil, title: nil)
    site = instance_double(Jekyll::Site, baseurl: baseurl)
    jekyll_post = double(:post)
    allow(jekyll_post).to receive(:data).and_return(data) unless data.nil?
    allow(jekyll_post).to receive(:title).and_return(title) unless title.nil?
    JekyllPagesApi::Page.new(jekyll_post, site)
  end

  def create_document(baseurl, relative_path, data: nil)
    site = instance_double(Jekyll::Site, baseurl: baseurl)
    jekyll_doc = instance_double(Jekyll::Document, relative_path: relative_path)
    allow(jekyll_doc).to receive(:data).and_return(data) unless data.nil?
    JekyllPagesApi::Page.new(jekyll_doc, site)
  end
end
