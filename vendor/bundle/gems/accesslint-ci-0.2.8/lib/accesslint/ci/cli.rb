require "thor"

module Accesslint
  module Ci
    class Cli < Thor
      desc "scan HOST", "scan HOST"
      option :"skip-ci", type: :boolean
      option :"hosted", type: :boolean
      def scan(host)
        current = Scanner.perform(host: host).split("\n")

        if !options[:"skip-ci"]
          existing = []

          if ENV.fetch("CIRCLE_BRANCH") != "master"
            if !options[:"hosted"]
              existing = LogManager.get.split("\n")
            end

            diff = current - existing

            if diff.any?
              Commenter.perform(diff)
            end
          end

          puts diff
        else
          puts current
        end
      end
    end
  end
end
