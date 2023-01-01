# frozen_string_literal: true

module RubyNPM
  module Options
    DEFINITIONS = [
      # concrete definitions
      [
        workspaces
      ],

      # string repeatable options
      {
        omit: '--omit',
        include: '--include'
      }.map do |key, name|
        definition(
          name: name, option_type: :standard, value_type: :string,
          repeatable: true, separator: ' ',
          override_keys: { singular: false, plural: key }
        )
      end,

      # string options
      %w[
        --color
        --install-strategy
        --loglevel
        --logs-dir
        --logs-max
        --script-shell
        --tag
        --workspace
      ].map do |o|
        definition(
          name: o, option_type: :standard, value_type: :string,
          separator: ' '
        )
      end,

      # flag options
      %w[
        --quiet
        --silent
        --verbose
      ].map do |o|
        definition(name: o, option_type: :flag, value_type: :boolean)
      end,

      # boolean options
      %w[
        --audit
        --bin-links
        --dry-run
        --force
        --foreground-scripts
        --fund
        --global
        --global-style
        --ignore-scripts
        --include-workspace-root
        --install-links
        --legacy-bundling
        --package-lock
        --package-lock-only
        --production
        --save
        --save-bundle
        --save-dev
        --save-exact
        --save-optional
        --save-peer
        --save-prod
        --strict-peer-deps
      ].map do |o|
        definition(
          name: o, option_type: :standard, value_type: :boolean,
          separator: ' '
        )
      end
    ].flatten.freeze
  end
end
