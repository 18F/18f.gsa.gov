require "uri"
require "fileutils"

module Accesslint
  module Ci
    LOG_FILE = "tmp/accesslint.log".freeze

    class Scanner
      def self.perform(*args)
        new(*args).perform
      end

      def initialize(host:, options: {})
        @host = host
        @options = options
      end

      def perform
        create_log_file

        `#{crawl_site}`

        File.read(LOG_FILE)
      end

      private

      attr_reader :host, :options

      def create_log_file
        FileUtils::mkdir_p("tmp")

        if File.exists?(LOG_FILE)
          FileUtils::rm(LOG_FILE)
        end
      end

      def crawl_site
        <<-SHELL
          (log_dir=$PWD && cd /tmp && wget #{host} 2>&1 \
            --accept #{acceptable_file_types} \
            --delete-after \
            --no-directories \
            --recursive \
            -erobots=off \
            | grep '^--' \
            | awk '{ print $3 }' \
            | grep -v '.css' \
            | grep -v '.txt' \
            | sort \
            | uniq \
            | xargs -n1 accesslint \
            >> $log_dir/#{LOG_FILE})
        SHELL
      end

      def acceptable_file_types
        %w(
          css
          html
        ).join(",")
      end
    end
  end
end
