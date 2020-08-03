module CodeClimate
  module TestReporter
    class CalculateBlob
      def initialize(file_path)
        @file_path = file_path
      end

      def blob_id
        calculate_with_file or calculate_with_git
      end

      private

      def calculate_with_file
        File.open(@file_path, "rb") do |file|
          header = "blob #{file.size}\0"
          content = file.read
          store = header + content

          return Digest::SHA1.hexdigest(store)
        end
      rescue EncodingError
        puts "WARNING: Unable to read #{@file_path}\nUsing git for blob calculation"
        nil
      end

      def calculate_with_git
        output = `git hash-object -t blob #{@file_path}`.chomp
        raise "ERROR: Failed to calculate blob with git" unless $?.success?

        output
      end
    end
  end
end
