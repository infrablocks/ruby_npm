# frozen_string_literal: true

require 'spec_helper'

describe RubyNPM::Commands::RunScript do
  subcommand = 'run-script'

  before do
    RubyNPM.configure do |config|
      config.binary = 'path/to/binary'
    end
  end

  after do
    RubyNPM.reset!
  end

  it_behaves_like(
    'a command without a binary supplied',
    described_class, subcommand
  )

  it_behaves_like(
    'a command with an argument',
    described_class, subcommand, :script
  )

  it_behaves_like(
    'a valid command line',
    described_class,
    reason:
      "calls the npm #{subcommand} command for the specified script passing " \
      'the supplied arguments',
    expected: "npm #{subcommand} script -- argument-value-1 argument-value-2",
    binary: 'npm',
    parameters: {
      script: 'script',
      arguments: %w[argument-value-1 argument-value-2]
    }
  )

  it_behaves_like(
    'a command with an option',
    described_class, subcommand, :loglevel
  )

  it_behaves_like(
    'a command with an option',
    described_class, subcommand, :logs_dir
  )

  it_behaves_like(
    'a command with an option',
    described_class, subcommand, :logs_max
  )

  it_behaves_like(
    'a command with an option',
    described_class, subcommand, :color
  )

  it_behaves_like(
    'a command with an option',
    described_class, subcommand, :script_shell
  )

  it_behaves_like(
    'a command with an array option',
    described_class, subcommand, :workspaces, singular_support: true
  )

  %i[
    foreground_scripts
    if_present
    ignore_scripts
    include_workspace_root
    json
    parseable
    workspaces
  ].each do |option|
    it_behaves_like(
      'a command with a boolean option',
      described_class, subcommand, option
    )
  end

  %i[
    quiet
    silent
    verbose
  ].each do |flag|
    it_behaves_like(
      'a command with a flag',
      described_class,
      subcommand,
      flag
    )
  end
end
