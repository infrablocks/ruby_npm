# frozen_string_literal: true

require_relative 'ruby_npm/options'
require_relative 'ruby_npm/version'
require_relative 'ruby_npm/commands'
require 'logger'

module RubyNPM
  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end

    def reset!
      @configuration = nil
    end
  end

  module ClassMethods
    def install(parameters = {}, invocation_options = {})
      exec(RubyNPM::Commands::Install,
           parameters, invocation_options)
    end

    def publish(parameters = {}, invocation_options = {})
      exec(RubyNPM::Commands::Publish,
           parameters, invocation_options)
    end

    def run_script(parameters = {}, invocation_options = {})
      exec(RubyNPM::Commands::RunScript,
           parameters, invocation_options)
    end

    private

    def exec(command_class, parameters, invocation_options)
      command_class.new.execute(parameters, invocation_options)
    end
  end

  extend ClassMethods

  def self.included(other)
    other.extend(ClassMethods)
  end

  class Configuration
    attr_accessor :binary, :logger, :options, :stdin, :stdout, :stderr

    def default_logger
      logger = Logger.new($stdout)
      logger.level = Logger::INFO
      logger
    end

    def default_options
      Options::Factory.new(Options::DEFINITIONS)
    end

    def initialize
      @binary = 'npm'
      @logger = default_logger
      @options = default_options
      @stdin = nil
      @stdout = $stdout
      @stderr = $stderr
    end
  end
end
