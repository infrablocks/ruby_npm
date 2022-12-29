# frozen_string_literal: true

require_relative 'base'

module RubyNPM
  module Commands
    class Install < Base
      # @!visibility private
      def subcommands
        %w[install]
      end
    end
  end
end
