module CodeClimate
  module TestReporter
    WARNING_MESSAGE = <<-EOS.freeze
      This usage of the Code Climate Test Reporter is now deprecated. Since version
      1.0, we now require you to run `SimpleCov` in your test/spec helper, and then
      run the provided `codeclimate-test-reporter` binary separately to report your
      results to Code Climate.

      More information here: https://github.com/codeclimate/ruby-test-reporter/blob/master/README.md
    EOS

    def self.start
      logger.warn(WARNING_MESSAGE)
      exit(1)
    end

    def self.run(results)
      return unless CodeClimate::TestReporter.run?
      formatted_results = CodeClimate::TestReporter::Formatter.new.format(results)
      CodeClimate::TestReporter::PostResults.new(formatted_results).post
    end

    def self.run?
      environment_variable_set? && run_on_current_branch?
    end

    def self.environment_variable_set?
      return @environment_variable_set if defined?(@environment_variable_set)

      @environment_variable_set = !!ENV["CODECLIMATE_REPO_TOKEN"]
      if @environment_variable_set
        logger.info("Reporting coverage data to Code Climate.")
      end

      @environment_variable_set
    end

    def self.run_on_current_branch?
      return @run_on_current_branch if defined?(@run_on_current_branch)

      @run_on_current_branch = true if configured_branch.nil?
      @run_on_current_branch ||= !!(current_branch =~ /#{configured_branch}/i)

      unless @run_on_current_branch
        logger.info("Not reporting to Code Climate because #{configured_branch} is set as the reporting branch.")
      end

      @run_on_current_branch
    end

    def self.configured_branch
      configuration.branch
    end

    def self.current_branch
      Git.branch_from_git_or_ci
    end

    def self.logger
      CodeClimate::TestReporter.configuration.logger
    end

    def self.tddium?
      ci_service_data && ci_service_data[:name] == "tddium"
    end

    def self.ci_service_data
      Ci.service_data
    end
  end
end
