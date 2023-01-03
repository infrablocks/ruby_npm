# frozen_string_literal: true

require_relative 'base'

module RubyNPM
  module Commands
    class Install < Base
      # @!visibility private
      def subcommands
        %w[install]
      end

      # @!visibility private
      # rubocop:disable Metrics/MethodLength
      def options
        super +
          Options::Sets::WORKSPACE_OPTIONS +
          Options::Sets::LOGGING_OPTIONS +
          Options::Sets::GLOBAL_OPTIONS +
          Options::Sets::DEPENDENCY_OPTIONS +
          Options::Sets::OUTPUT_OPTIONS +
          %w[
            --audit
            --bin-links
            --fund
            --global
            --global-style
            --install-links
            --install-strategy
            --legacy-bundling
            --package-lock
            --package-lock-only
            --strict-peer-deps
            --tag
          ]
      end
      # rubocop:enable Metrics/MethodLength

      def arguments(parameters)
        [parameters[:package_specs]]
      end
    end
  end
end
