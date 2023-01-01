# frozen_string_literal: true

require 'spec_helper'

describe RubyNPM::Commands::Install do
  subcommand = 'install'

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
    'a command with an argument array',
    described_class, subcommand, :packages
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

  it_behaves_like(
    'a command with an array option',
    described_class, subcommand, :omit
  )

  it_behaves_like(
    'a command with an option',
    described_class, subcommand, :tag
  )

  it_behaves_like(
    'a command with an option',
    described_class, subcommand, :install_strategy
  )

  it_behaves_like(
    'a command with an array option',
    described_class, subcommand, :include
  )

  %i[
    audit
    bin_links
    dry_run
    force
    foreground_scripts
    fund
    global
    global_style
    ignore_scripts
    include_workspace_root
    install_links
    legacy_bundling
    package_lock
    package_lock_only
    production
    save
    save_bundle
    save_dev
    save_exact
    save_optional
    save_peer
    save_prod
    strict_peer_deps
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
