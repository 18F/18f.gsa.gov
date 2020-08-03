# encoding: UTF-8

require 'json'
require_relative 'support/shell'

describe "integration" do
  BUILD_DIR = File.join(Dir.pwd, 'spec', 'site')
  JSON_PATH = File.join(BUILD_DIR, '_site', 'api', 'v1', 'pages.json')

  def read_json(path)
    contents = File.read(path)
    JSON.parse(contents)
  end

  def pages_data
    @json ||= read_json(JSON_PATH)
  end

  def entries_data
    pages_data['entries']
  end

  def page_data(url)
    entries_data.find{|page| page['url'] == url }
  end

  def homepage_data
    page_data('/')
  end

  before(:context) do
    # http://bundler.io/man/bundle-exec.1.html#Shelling-out
    Bundler.with_clean_env do
      Dir.chdir(BUILD_DIR) do
        run_cmd("JEKYLL_VERSION=#{Jekyll::VERSION} bundle update")
        run_cmd("JEKYLL_VERSION=#{Jekyll::VERSION} bundle exec jekyll build")
      end
    end
  end

  it "generates the JSON file" do
    expect(File.exist?(JSON_PATH)).to be_truthy
  end

  it "includes an entry for every page" do
    urls = entries_data.map{|page| page['url'] }

    # not sure why this discrepancy exists...
    if Jekyll::VERSION.start_with?('3.')
      expect(urls).to eq(%w(
        /about/
        /
        /unicode.html
        /jekyll/update/2015/01/26/welcome-to-jekyll.html
        /jekyll/update/2015/05/25/do-not-render-result.html
      ))
    else
      expect(urls).to eq(%w(
        /jekyll/update/2015/01/26/welcome-to-jekyll.html
        /jekyll/update/2015/05/25/do-not-render-result.html
        /about/
        /index.html
        /unicode.html
      ))
    end
  end

  it "does not render the pages corpus using Liquid" do
    # The content of each page in the pages corpus should be Liquid-rendered,
    # but rendering the pages.json corpus may cause pages that contain code
    # examples of Liquid tags may produce invalid JSON.
    page = page_data '/jekyll/update/2015/05/25/do-not-render-result.html'
    expect(page['body']).to_not include('{% raw %}')
    expect(page['body']).to include('{% author chrisc %}')
  end

  it "removes HTML tags" do
    entries_data.each do |page|
      expect(page['body']).to_not include('<')
    end
  end

  it "condenses the content" do
    entries_data.each do |page|
      expect(page['body']).to_not match(/\s{2,}/m)
    end
  end

  it "handles unicode" do
    page = page_data('/unicode.html')
    expect(page['body']).to eq("”Handle the curly quotes!” they said.")
  end

  it "includes front matter tags" do
    page = page_data('/about/')
    expect(page['tags']).to eq(["Jekyll", "test page", "convenient"])
  end

  it "sets skip_index only if it is true" do
    page = page_data('/about/')
    expect(page['skip_index']).to eq(true)
    page = page_data('/unicode.html')
    expect(page['skip_index']).to eq(nil)
  end
end
