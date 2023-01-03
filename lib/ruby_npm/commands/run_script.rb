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
      def options
        super +
          Options::Sets::WORKSPACE_OPTIONS +
          Options::Sets::LOGGING_OPTIONS +
          Options::Sets::GLOBAL_OPTIONS +
          Options::Sets::OUTPUT_OPTIONS +
          %w[
            --if-present
            --parseable
          ]
      end

      def arguments(parameters)
        script_arguments =
          parameters[:arguments] ? ['--'] + parameters[:arguments] : []

        [parameters[:script]] + script_arguments
      end
    end
  end
end
