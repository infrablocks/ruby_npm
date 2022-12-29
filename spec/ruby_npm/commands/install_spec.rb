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
end
