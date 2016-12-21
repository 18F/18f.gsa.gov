require 'redcarpet'
require 'rouge'
require 'rouge/plugins/redcarpet'
require 'pry'

# Create a custom renderer that extend Redcarpet to customize its behavior.
class RedcarpetExtender < Redcarpet::Render::HTML
  include Rouge::Plugins::Redcarpet

  def initialize(options = {})
    options ||= {}
    redcarpet_extensions = Jekyll.configuration({})['redcarpet']['extensions']
    config_options = Hash[*redcarpet_extensions.map { |e| [e.to_sym, true] }.flatten]
    super options.merge(config_options)
  end

  def strip_dashes(str)
    str = str.to_s
    str = if str[0] == '-'
            str[1...str.length]
          else
            str
          end
    if str[-1] == '-'
      str[0...-1]
    else
      str
    end
  end

  def block_quote(quote)
    quotes = quote.split("\n\n")
    if quotes.count > 1
      blockquote = quotes.map do |q|
        "<blockquote>#{q}</blockquote>"
      end.join("\n")
      %(#{blockquote})
    else
      %(<blockquote>#{quote}</blockquote>)
    end
  end

  def block_code(code, language)
    Rouge.highlight(code, language || 'text', 'html')
  end

  def header(title, level)
    @headers = SiteHeaders.current
    id_name = title.downcase.gsub(/[^a-z\0-9\s]/, '').gsub(/\W+/, '-')
    id_name = strip_dashes(id_name)
    if @headers.include?(id_name)
      id_name += '_1'
      loop do
        break unless @headers.include?(id_name)
        id_name.gsub!(/\_(\d+)$/, "_#{$1.to_i + 1}")
      end
    end
    SiteHeaders.add id_name
    %(\n<h#{level} id="#{id_name}">#{title}</h#{level}>\n)
  end

  # Block level extensions go here
  # For more on what blocks are currently
  # available, visit
  # https://github.com/vmg/redcarpet/
end

# Helper class for keeping track of the headers that have been modified using
# the block-level Redcarpet method `header()`
# SiteHeaders.current returns the @current_headers array
# SiteHeaders.add updates the array, @current_headers
# SiteHeaders.clear clears the @current_headers array
class SiteHeaders
  def initialize
    @current_headers ||= []
  end

  def self.current
    @current_headers
  end

 def self.add(item)
    if @current_headers
      @current_headers << item
    else
      @current_headers = [item]
    end
 end

  def self.clear
    @current_headers = []
  end
end

module Jekyll
  module Converters
    class Markdown::RedcarpetExt
      def initialize(config)
        @site_config = config
      end

      def extensions
        Hash[*@site_config['redcarpet']['extensions'].map { |e| [e.to_sym, true] }.flatten]
      end

      def markdown
        @markdown ||= Redcarpet::Markdown.new(RedcarpetExtender, extensions)
      end

      def convert(content)
        # Clear the headers array so that we don't duplcate headers on different pages
        SiteHeaders.clear

        return super unless @site_config['markdown'] == 'RedcarpetExt'
        markdown.render(content)
      end
    end
  end
end
