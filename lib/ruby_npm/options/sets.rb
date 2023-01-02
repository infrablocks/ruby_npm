# frozen_string_literal: true

module RubyNPM
  module Options
    module Sets
      WORKSPACE_OPTIONS = %w[
        --include-workspace-root
        --workspace
        --workspaces
      ].freeze

      LOGGING_OPTIONS = %w[
        --loglevel
        --logs-dir
        --logs-max
        --quiet
        --silent
        --verbose
      ].freeze

      GLOBAL_OPTIONS = %w[
        --color
        --dry-run
        --force
        --foreground-scripts
        --ignore-scripts
        --script-shell
      ].freeze

      DEPENDENCY_OPTIONS = %w[
        --include
        --omit
        --save
        --save-bundle
        --save-dev
        --save-exact
        --save-optional
        --save-peer
        --save-prefix
        --save-prod
      ].freeze

      OUTPUT_OPTIONS = %w[
        --json
      ].freeze
    end
  end
end
