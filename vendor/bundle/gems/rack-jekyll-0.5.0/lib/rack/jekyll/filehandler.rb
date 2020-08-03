module Rack
  class Jekyll
    class FileHandler

      attr_reader :root, :files

      # Initializes a FileHandler for a given root directory
      # (for testing only: use a given array of filenames, +files+).
      def initialize(root, files = nil)
        @root = ::File.expand_path(root)
        @files = files || get_file_list
      end

      def empty?
        @files.empty?
      end

      def update
        @files = get_file_list
      end

      # Returns the full file system path of the file corresponding to
      # the given URL path, or +nil+ if no corresponding file exists.
      def get_filename(path)
        fullpath = ::File.join(@root, path)

        if fullpath.end_with?("/")
          normalized = fullpath + "index.html"
        elsif !@files.include?(fullpath)
          normalized = fullpath + "/index.html"
        else
          normalized = fullpath
        end

        if @files.include?(normalized)
          filename = normalized
        else
          filename = nil
        end

        filename
      end

      private

      # Retrieves and returns a list of all files in the root directory
      # (excluding directory names).
      def get_file_list
        files = ::Dir[@root + "/**/*"]
        files.delete_if {|file| ::FileTest.directory?(file) }

        files
      end
    end
  end
end
