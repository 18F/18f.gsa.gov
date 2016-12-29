require_relative '../../_plugins/embeds'
require 'liquid'
require 'pry'
require 'rb-readline'

RSpec.describe Jekyll::EmbedFilter do
  it "takes returns an imbed given one variable" do
    # binding.pry
    # liquid = <<-LIQUID
    # {{ '/url/' | embed }}
    # LIQUID

    # embed_filter = Liquid::Template.register_filter(Jekyll::EmbedFilter)

    actual = embed_filter.embed('/url/')

    expected = "<div class='embed-container'><iframe src='#{input}' title='#{title}'" \
        " width='560' height='315' frameborder='0' allowfullscreen></iframe></div>"

    expect(expected).to eq actual
  end
end
