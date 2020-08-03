module CodeClimate
  module TestReporter
    class ShortenFilename
      def initialize(filename)
        @filename = filename
      end

      def short_filename
        return @filename unless ::SimpleCov.root
        apply_prefix @filename.gsub(/^#{Regexp.escape(::SimpleCov.root)}/, ".").gsub(%r{^\./}, "")
      end

      private

      def apply_prefix(filename)
        if (prefix = CodeClimate::TestReporter.configuration.path_prefix)
          File.join(prefix, filename)
        else
          filename
        end
      end
    end
  end
end
