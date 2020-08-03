module CodeClimate
  module TestReporter
    InvalidPayload = Class.new(StandardError)

    class PayloadValidator
      def initialize(payload)
        @payload = payload
      end

      def self.validate(payload)
        new(payload).validate
      end

      def validate
        raise InvalidPayload, "A git commit sha was not found in the test report payload" unless commit_sha
        raise InvalidPayload, "A git commit timestamp was not found in the test report payload" unless committed_at
        raise InvalidPayload, "A run at timestamp was not found in the test report payload" unless run_at
        raise InvalidPayload, "No source files were found in the test report payload" unless source_files?
        raise InvalidPayload, "Invalid source files were found in the test report payload" unless valid_source_files?
        true
      end

      private

      def commit_sha
        commit_sha_from_git || commit_sha_from_ci_service
      end

      def committed_at
        (@payload[:git] && @payload[:git][:committed_at]) ||
          (@payload[:ci_service] && @payload[:ci_service][:committed_at])
      end

      def run_at
        @payload[:run_at]
      end

      def source_files?
        @payload[:source_files] && @payload[:source_files].any?
      end

      def valid_source_files?
        @payload[:source_files].all? { |s| valid_source_file?(s) }
      end

      def valid_source_file?(file)
        file.is_a?(Hash) && file[:coverage] && file[:name]
      end

      def commit_sha_from_git
        @payload[:git] && @payload[:git][:head]
      end

      def commit_sha_from_ci_service
        @payload[:ci_service] && @payload[:ci_service][:commit_sha]
      end
    end
  end
end
