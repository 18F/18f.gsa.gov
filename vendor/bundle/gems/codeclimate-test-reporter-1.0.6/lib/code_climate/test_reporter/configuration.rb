require "logger"

module CodeClimate
  module TestReporter
    @@configuration = nil

    def self.configure
      @@configuration = Configuration.new

      if block_given?
        yield configuration
      end

      configuration
    end

    def self.configuration
      @@configuration || configure
    end

    class Configuration
      attr_accessor :branch, :path_prefix, :gzip_request, :git_dir

      attr_writer :logger, :profile, :timeout

      def initialize
        @gzip_request = true
      end

      def logger
        @logger ||= default_logger
      end

      def profile
        @profile ||= "test_frameworks"
      end

      def skip_token
        @skip_token ||= "nocov"
      end

      def timeout
        @timeout ||= Client::DEFAULT_TIMEOUT
      end

      private

      def default_logger
        log = Logger.new($stderr)
        log.level = Logger::INFO

        log
      end
    end
  end
end
