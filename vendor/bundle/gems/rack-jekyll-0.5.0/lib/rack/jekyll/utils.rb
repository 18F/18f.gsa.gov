module Rack
  class Jekyll
    module Utils

      def self.media_type(filename)
        extension = ::File.extname(filename)

        Rack::Mime.mime_type(extension)
      end

      def self.file_info(path)
        info = {
          :body => ::File.read(path),
          :time => ::File.mtime(path).httpdate
        }

        info
      end
    end
  end
end
