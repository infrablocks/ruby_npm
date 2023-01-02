# frozen_string_literal: true

require 'spec_helper'

describe RubyNPM::Commands::Publish do
  subcommand = 'publish'

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
    described_class, subcommand, :package_spec
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
    'a command with an option',
    described_class, subcommand, :tag
  )

  it_behaves_like(
    'a command with an option',
    described_class, subcommand, :access
  )

  it_behaves_like(
    'a command with an option',
    described_class, subcommand, :otp
  )

  it_behaves_like(
    'a command with an array option',
    described_class, subcommand, :workspaces, singular_support: true
  )

  # used in code path, not sure whether to include
  # - before
  # - cache
  # - offline
  # - pack-destination
  # - prefer-offline
  # - prefer-online
  # - prefix
  # - replace-registry-host
  # - user-agent

  %i[
    dry_run
    foreground_scripts
    ignore_scripts
    include_workspace_root
    json
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
