require 'spec_helper'
require 'logger'

describe "backwards compatible level" do
  let(:logger) { Logger.new($stdout) }

  before do
    logger.level = level
  end

  context "with a Yell::Level instance" do
    let(:level) { Yell::Level.new(:error) }

    it "should format out the level correctly" do
      expect(logger.level).to eq(level.to_i)
    end
  end

  context "with a symbol", :pending => (RUBY_VERSION < "2.3") do
    let(:level) { :error }

    it "should format out the level correctly" do
      expect(logger.level).to eq(3)
    end
  end

  context "with an integer" do
    let(:level) { 2 }

    it "should format out the level correctly" do
      expect(logger.level).to eq(2)
    end
  end


end
