# frozen_string_literal: true

require_relative '../name'
require_relative '../types'
require_relative '../values'

module RubyNPM
  module Options
    module Definitions
      class Workspaces
        attr_reader :workspace_name, :workspaces_name

        def initialize
          @workspace_name = Name.new('--workspace')
          @workspaces_name = Name.new('--workspaces')
        end

        def matches?(name)
          workspaces_name == Name.new(name)
        end

        def build(parameters)
          build_workspace_options(parameters) +
            build_workspaces_option(parameters)
        end

        private

        def build_workspace_options(parameters)
          workspaces = parameters[:workspaces]

          return build_no_options if workspaces.nil? || boolean?(workspaces)

          if workspaces.is_a?(Array)
            return workspaces.map do |v|
              build_string_option(workspace_name, v)
            end
          end

          [build_string_option(workspace_name, workspaces)]
        end

        def build_workspaces_option(parameters)
          workspaces = parameters[:workspaces]

          return build_no_options if workspaces.nil? || !boolean?(workspaces)

          [build_boolean_option(workspaces_name, workspaces)]
        end

        def build_no_options
          []
        end

        def build_string_option(name, value)
          Options.types.standard(
            name, Options.values.string(value), separator: ' '
          )
        end

        def build_boolean_option(name, value)
          Options.types.standard(
            name, Options.values.boolean(value), separator: ' '
          )
        end

        def boolean?(value)
          [true, false].include?(value)
        end
      end
    end
  end
end
