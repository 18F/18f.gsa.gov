require "spec_helper"

describe Chromedriver::Helper::GoogleCodeParser do
  let!(:open_uri_provider) do
    double("open_uri_provider").tap do |oup|
      allow(oup).to receive(:open_uri) do |uri|
        case uri.to_s
        when "https://chromedriver.storage.googleapis.com/LATEST_RELEASE"
          StringIO.new("2.42")
        when "https://chromedriver.storage.googleapis.com"
          StringIO.new(File.read(File.join(File.dirname(__FILE__), "assets/google-code-bucket.xml")))
        end
      end
    end
  end
  let!(:parser) { Chromedriver::Helper::GoogleCodeParser.new('mac', open_uri_provider) }

  describe "#downloads" do
    it "returns an array of URLs for the platform" do
      expect(parser.downloads).to eq [
        "https://chromedriver.storage.googleapis.com/2.0/chromedriver_mac32.zip",
        "https://chromedriver.storage.googleapis.com/2.1/chromedriver_mac32.zip",
        "https://chromedriver.storage.googleapis.com/2.2/chromedriver_mac32.zip",
        "https://chromedriver.storage.googleapis.com/2.3/chromedriver_mac32.zip",
        "https://chromedriver.storage.googleapis.com/2.4/chromedriver_mac32.zip"]
    end
  end

  describe "#newest_download_version" do
    it "returns the last URL for the platform" do
      expect(parser.newest_download_version).to eq Gem::Version.new("2.42")
    end
  end

  describe '#version_download_url' do
    it 'returns the version asked for' do
      expect(parser.version_download_url(2.0)).to eq "https://chromedriver.storage.googleapis.com/2.0/chromedriver_mac32.zip"
    end
  end
end
