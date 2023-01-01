# frozen_string_literal: true

require_relative 'base'

module RubyNPM
  module Commands
    class RunScript < Base
      # @!visibility private
      def subcommands
        %w[run-script]
      end

      # @!visibility private
      # rubocop:disable Metrics/MethodLength
      def options
        %w[
          --color
          --foreground-scripts
          --if-present
          --ignore-scripts
          --include-workspace-root
          --json
          --loglevel
          --logs-dir
          --logs-max
          --parseable
          --quiet
          --script-shell
          --silent
          --verbose
          --workspace
          --workspaces
        ] + super
      end
      # rubocop:enable Metrics/MethodLength

      def arguments(parameters)
        script_arguments =
          parameters[:arguments] ? ['--'] + parameters[:arguments] : []

        [parameters[:script]] + script_arguments
      end
    end
  end
end
