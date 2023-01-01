# frozen_string_literal: true

require_relative 'options/name'
require_relative 'options/types'
require_relative 'options/values'
require_relative 'options/definitions/generic'
require_relative 'options/definitions/workspaces'
require_relative 'options/factory'
require_relative 'options/sets'

module RubyNPM
  module Options
    def self.name(name)
      Name.new(name)
    end

    def self.definition(opts)
      Definitions::Generic.new(opts)
    end

    def self.workspaces
      Definitions::Workspaces.new
    end

    def self.types
      Types
    end

    def self.values
      Values
    end
  end
end

require_relative 'options/definitions'
