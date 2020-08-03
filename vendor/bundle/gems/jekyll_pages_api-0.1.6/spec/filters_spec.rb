describe JekyllPagesApi::Filters do
  describe '#condense' do
    it "removes line breaks" do
      expect(subject.condense("foo\n   bar")).to eq('foo bar')
    end
  end
  describe '#text_only' do
    it "removes HTML" do
      expect(subject.text_only(test_html)).to eq('some text')
    end
  end

  def test_html
    '<p>some text</p>'
  end
end
