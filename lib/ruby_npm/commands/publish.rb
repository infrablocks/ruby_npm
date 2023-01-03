# frozen_string_literal: true

require_relative 'base'

module RubyNPM
  module Commands
    class Publish < Base
      # @!visibility private
      def subcommands
        %w[publish]
      end

      # @!visibility private
      def options
        super +
          Options::Sets::WORKSPACE_OPTIONS +
          Options::Sets::LOGGING_OPTIONS +
          Options::Sets::GLOBAL_OPTIONS +
          Options::Sets::OUTPUT_OPTIONS +
          %w[
            --access
            --otp
            --tag
          ]
      end

      def arguments(parameters)
        [parameters[:package_spec]]
      end
    end
  end
end
