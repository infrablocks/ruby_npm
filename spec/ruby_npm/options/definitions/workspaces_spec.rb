# frozen_string_literal: true

require 'spec_helper'

describe RubyNPM::Options::Definitions::Workspaces do
  describe '#matches?' do
    it 'matches when passed option name is workspaces' do
      %w[
        workspaces
        -workspaces
        --workspaces
        ---workspaces
      ].each do |singular_name|
        expect(described_class.new.matches?(singular_name)).to(be(true))
      end
    end

    it 'mismatches when passed option name is something else' do
      %w[
        --include-workspace-root
        --verbose
        --no-save
      ].each do |name|
        expect(described_class.new.matches?(name)).to(be(false))
      end
    end
  end
end
