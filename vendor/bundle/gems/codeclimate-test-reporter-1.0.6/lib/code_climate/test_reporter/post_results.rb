module CodeClimate
  module TestReporter
    class PostResults
      def initialize(results)
        @results = results
      end

      def post
        if write_to_file?
          file_path = File.join(Dir.tmpdir, "codeclimate-test-coverage-#{SecureRandom.uuid}.json")
          print "Coverage results saved to #{file_path}... "
          File.open(file_path, "w") { |file| file.write(@results.to_json) }
        else
          client = Client.new
          print "Sending report to #{client.host} for branch #{Git.branch_from_git_or_ci}... "
          client.post_results(@results)
        end

        puts "done."
      end

      private

      def write_to_file?
        warn "TO_FILE is deprecated, use CODECLIMATE_TO_FILE" if ENV["TO_FILE"]
        CodeClimate::TestReporter.tddium? || ENV["CODECLIMATE_TO_FILE"] || ENV["TO_FILE"]
      end
    end
  end
end
