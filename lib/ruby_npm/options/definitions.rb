# frozen_string_literal: true

module RubyNPM
  # rubocop:disable Metrics/ModuleLength
  module Options
    WORKSPACE_DEFINITIONS = [
      workspaces,
      definition(
        name: '--workspace',
        option_type: :standard,
        value_type: :string
      ),
      definition(
        name: '--include-workspace-root',
        option_type: :standard,
        value_type: :boolean
      )
    ].freeze

    LOGGING_DEFINITIONS = [
      # string options
      %w[
        --loglevel
        --logs-dir
        --logs-max
      ].map do |o|
        definition(
          name: o, option_type: :standard, value_type: :string
        )
      end,

      # flag options
      %w[
        --quiet
        --silent
        --verbose
      ].map do |o|
        definition(name: o, option_type: :flag, value_type: :boolean)
      end
    ].flatten.freeze

    GLOBAL_DEFINITIONS = [
      # string options
      %w[
        --color
        --script-shell
      ].map do |o|
        definition(
          name: o, option_type: :standard, value_type: :string
        )
      end,

      # boolean options
      %w[
        --dry-run
        --force
        --foreground-scripts
        --ignore-scripts
      ].map do |o|
        definition(
          name: o, option_type: :standard, value_type: :boolean
        )
      end
    ].flatten.freeze

    DEPENDENCY_DEFINITIONS = [
      # string options
      %w[
        --save-prefix
      ].map do |o|
        definition(
          name: o, option_type: :standard, value_type: :string
        )
      end,

      # string repeatable options
      {
        omit: '--omit',
        include: '--include'
      }.map do |key, name|
        definition(
          name:, option_type: :standard, value_type: :string,
          repeatable: true,
          override_keys: { singular: false, plural: key }
        )
      end,

      # boolean options
      %w[
        --save
        --save-bundle
        --save-dev
        --save-exact
        --save-optional
        --save-peer
        --save-prod
      ].map do |o|
        definition(
          name: o, option_type: :standard, value_type: :boolean
        )
      end
    ].flatten.freeze

    OUTPUT_DEFINITIONS = [
      # boolean options
      %w[
        --json
      ].map do |o|
        definition(
          name: o, option_type: :standard, value_type: :boolean
        )
      end
    ].flatten.freeze

    OTHER_DEFINITIONS = [
      # string options
      %w[
        --access
        --install-strategy
        --otp
        --tag
      ].map do |o|
        definition(
          name: o, option_type: :standard, value_type: :string
        )
      end,

      # boolean options
      %w[
        --audit
        --bin-links
        --fund
        --global
        --global-style
        --if-present
        --install-links
        --legacy-bundling
        --package-lock
        --package-lock-only
        --parseable
        --strict-peer-deps
      ].map do |o|
        definition(
          name: o, option_type: :standard, value_type: :boolean
        )
      end
    ].flatten.freeze

    DEFINITIONS = (
      WORKSPACE_DEFINITIONS +
        LOGGING_DEFINITIONS +
        GLOBAL_DEFINITIONS +
        DEPENDENCY_DEFINITIONS +
        OUTPUT_DEFINITIONS +
        OTHER_DEFINITIONS
    )
  end
  # rubocop:enable Metrics/ModuleLength
end
