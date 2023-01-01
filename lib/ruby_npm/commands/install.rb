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
        %w[
          --audit
          --bin-links
          --color
          --dry-run
          --force
          --foreground-scripts
          --fund
          --global
          --global-style
          --ignore-scripts
          --include
          --include-workspace-root
          --install-links
          --install-strategy
          --legacy-bundling
          --loglevel
          --logs-dir
          --logs-max
          --omit
          --package-lock
          --package-lock-only
          --production
          --quiet
          --save
          --save-bundle
          --save-dev
          --save-exact
          --save-optional
          --save-peer
          --save-prod
          --script-shell
          --silent
          --strict-peer-deps
          --tag
          --verbose
          --workspace
          --workspaces
        ] + super
      end
      # rubocop:enable Metrics/MethodLength

      def arguments(parameters)
        [parameters[:packages]]
      end
    end
  end
end
