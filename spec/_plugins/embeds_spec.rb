require_relative "../../_plugins/embed"

RSpec.describe Jekyll::EmbedFilter do
  before(:each) do
    @embed_filter = Class.new.new # instantiate a nothing class
    @embed_filter.extend(Jekyll::EmbedFilter)
  end
  it "takes returns an embed given one variable" do
    actual = @embed_filter.embed("/url/")

    expected = "<div class='embed-container'><iframe src='/url/' title='/url/'" \
        " width='560' height='315' frameborder='0' allowfullscreen></iframe></div>"
    expect(expected).to eq actual
  end

  it "takes returns an embed given two variable" do
    actual = @embed_filter.embed("/url/", "url title")

    expected = "<div class='embed-container'><iframe src='/url/' title='url title'" \
        " width='560' height='315' frameborder='0' allowfullscreen></iframe></div>"
    expect(expected).to eq actual
  end
end
