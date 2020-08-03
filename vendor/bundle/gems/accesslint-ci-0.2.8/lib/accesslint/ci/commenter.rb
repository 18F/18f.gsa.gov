require "rest-client"

module Accesslint
  module Ci
    class Commenter
      class CommenterError < StandardError; end

      def self.perform(*args)
        new(*args).perform
      end

      def initialize(errors)
        @errors = errors
      end

      def perform
        RestClient.post(accesslint_service_url, body: payload)
      rescue CommenterError, RestClient::ExceptionWithResponse => e
        puts e.message
      end

      private

      attr_reader :errors

      def accesslint_service_url
        @accesslint_service_url ||= URI(
          File.join([
            "https://#{authentication}@accesslint.com/api/v1/projects/",
            project_path,
            "pulls",
            pull_request_number,
            "comments",
          ])
        ).to_s
      end

      def authentication
        "#{github_user}:#{ENV.fetch('ACCESSLINT_API_TOKEN')}"
      end

      def pull_request_number
        if !ENV.fetch("CI_PULL_REQUEST", "").empty?
          ENV.fetch("CI_PULL_REQUEST").split("/").last
        else
          raise CommenterError.new(
            "Failed to comment: CI_PULL_REQUEST is missing."
          )
        end
      end

      def payload
        { errors: errors }.to_json
      end

      def github_user
        ENV.fetch("ACCESSLINT_GITHUB_USER")
      end

      def project_path
        [
          ENV.fetch("CIRCLE_PROJECT_USERNAME"),
          ENV.fetch("CIRCLE_PROJECT_REPONAME"),
        ].join("/")
      end
    end
  end
end
