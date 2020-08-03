module CodeClimate
  module TestReporter
    class Git
      class << self
        def info
          {
            head:         head,
            committed_at: committed_at_from_git_or_ci,
            branch:       branch_from_git_or_ci,
          }
        end

        def branch_from_git_or_ci
          clean_service_branch || clean_git_branch || "master"
        end

        def committed_at_from_git_or_ci
          committed_at_from_git || committed_at_from_ci
        end

        def clean_service_branch
          ci_branch = String(Ci.service_data[:branch])
          clean = ci_branch.strip.sub(%r{^origin/}, "")

          !clean.empty? ? clean : nil
        end

        def clean_git_branch
          git_branch = String(branch_from_git)
          clean = git_branch.sub(%r{^origin/}, "") unless git_branch.start_with?("(")

          !clean.empty? ? clean : nil
        end

        private

        def head
          git("log -1 --pretty=format:'%H'")
        end

        def committed_at_from_ci
          if (value = Ci.service_data[:committed_at])
            value.to_i
          end
        end

        def committed_at_from_git
          committed_at = git("log -1 --pretty=format:%ct")
          committed_at.to_i.zero? ? nil : committed_at.to_i
        end

        def branch_from_git
          git("rev-parse --abbrev-ref HEAD").chomp
        end

        def git(command)
          `git --git-dir="#{git_dir}/.git" #{command}`
        end

        def git_dir
          return configured_git_dir unless configured_git_dir.nil?
          rails_git_dir_present? ? Rails.root : "."
        end

        def configured_git_dir
          CodeClimate::TestReporter.configuration.git_dir
        end

        def rails_git_dir_present?
          const_defined?(:Rails) && Rails.respond_to?(:root) && !Rails.root.nil? &&
            File.directory?(File.expand_path(".git", Rails.root))
        end
      end
    end
  end
end
