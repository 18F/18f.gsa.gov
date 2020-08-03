# encoding: utf-8

require "tmpdir"
require "securerandom"
require "json"
require "digest/sha1"
require "simplecov"

require "code_climate/test_reporter/exception_message"
require "code_climate/test_reporter/payload_validator"

module CodeClimate
  module TestReporter
    class Formatter
      def format(results)
        simplecov_results = results.map do |command_name, data|
          SimpleCov::Result.from_hash(command_name => data)
        end

        simplecov_result =
          if simplecov_results.size == 1
            simplecov_results.first
          else
            merge_results(simplecov_results)
          end

        payload = to_payload(simplecov_result)
        PayloadValidator.validate(payload)

        payload
      end

      private

      def partial?
        CodeClimate::TestReporter.tddium?
      end

      def to_payload(result)
        totals = Hash.new(0)
        source_files = result.files.map do |file|
          totals[:total] += file.lines.count
          totals[:covered] += file.covered_lines.count
          totals[:missed] += file.missed_lines.count

          # Set coverage for all skipped lines to nil
          file.skipped_lines.each do |skipped_line|
            file.coverage[skipped_line.line_number - 1] = nil
          end

          {
            name:             ShortenFilename.new(file.filename).short_filename,
            blob_id:          CalculateBlob.new(file.filename).blob_id,
            coverage:         file.coverage.to_json,
            covered_percent:  round(file.covered_percent, 2),
            covered_strength: round(file.covered_strength, 2),
            line_counts: {
              total:    file.lines.count,
              covered:  file.covered_lines.count,
              missed:   file.missed_lines.count,
            },
          }
        end

        {
          repo_token:       ENV["CODECLIMATE_REPO_TOKEN"],
          source_files:     source_files,
          run_at:           result.created_at.to_i,
          covered_percent:  result.source_files.covered_percent.round(2),
          covered_strength: result.source_files.covered_strength.round(2),
          line_counts:      totals,
          partial:          partial?,
          git: Git.info,
          environment: {
            pwd:            Dir.pwd,
            rails_root:     (Rails.root.to_s rescue nil),
            simplecov_root: ::SimpleCov.root,
            gem_version:    VERSION,
          },
          ci_service: CodeClimate::TestReporter.ci_service_data,
        }
      end

      # Convert to Float before rounding.
      # Fixes [#7] possible segmentation fault when calling #round on a Rational
      def round(numeric, precision)
        Float(numeric).round(precision)
      end

      # Re-implementation of Simplecov::ResultMerger#merged_result, which is
      # needed because calling it directly gets you into caching land with files
      # on disk.
      def merge_results(results)
        merged = {}
        results.each do |result|
          merged = result.original_result.merge_resultset(merged)
        end
        result = SimpleCov::Result.new(merged)
        result.command_name = results.map(&:command_name).sort.join(", ")
        result
      end
    end
  end
end
