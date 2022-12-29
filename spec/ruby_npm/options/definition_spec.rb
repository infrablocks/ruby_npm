# frozen_string_literal: true

require 'spec_helper'

describe RubyNPM::Options::Definition do
  it 'raises an error when no name provided on construction' do
    expect { described_class.new({}) }
      .to(raise_error('Missing name.'))
  end
end
