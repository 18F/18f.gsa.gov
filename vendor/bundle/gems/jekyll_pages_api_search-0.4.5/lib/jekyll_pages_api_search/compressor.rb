require 'fileutils'
require 'zlib'

module JekyllPagesApiSearch
  class Compressor
    def self.gzip_in_memory_content(file_to_content_hash)
      file_to_content_hash.each do |file, content|
        ::Zlib::GzipWriter.open("#{file}.gz", Zlib::BEST_COMPRESSION) do |gz|
          gz.write content
        end
        FileUtils.touch([file, "#{file}.gz"])
      end
    end
  end
end
