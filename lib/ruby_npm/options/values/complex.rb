# frozen_string_literal: true

require 'json'

require_relative 'base'

module RubyNPM
  module Options
    module Values
      class Complex < Base
        def resolve
          @value
        end

        def render
          @value.is_a?(::String) ? @value : JSON.generate(value)
        end
      end
    end
  end
end
