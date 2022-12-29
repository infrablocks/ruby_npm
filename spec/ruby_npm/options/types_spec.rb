# frozen_string_literal: true

require 'spec_helper'

describe RubyNPM::Options::Types do
  describe '.flag' do
    it 'builds a flag type' do
      expect(described_class.flag(
               '-flag', RubyNPM::Options::Values.boolean(true)
             ))
        .to(eq(RubyNPM::Options::Types::Flag.new(
                 '-flag', RubyNPM::Options::Values.boolean(true)
               )))
    end
  end

  describe '.standard' do
    it 'builds a standard type' do
      expect(described_class.standard(
               '-opt',
               RubyNPM::Options::Values.string('/some/path')
             ))
        .to(eq(RubyNPM::Options::Types::Standard.new(
                 '-opt',
                 RubyNPM::Options::Values.string('/some/path')
               )))
    end

    it 'passes the provided keyword arguments' do
      expect(described_class.standard(
               '-opt',
               RubyNPM::Options::Values.string('/some/path'),
               separator: '~'
             ))
        .to(eq(RubyNPM::Options::Types::Standard.new(
                 '-opt',
                 RubyNPM::Options::Values.string('/some/path'),
                 separator: '~'
               )))
    end
  end

  describe '.resolve' do
    it 'returns Types::Flag for :flag' do
      expect(described_class.resolve(:flag))
        .to(eq(RubyNPM::Options::Types::Flag))
    end

    it 'returns Types::Standard for :complex' do
      expect(described_class.resolve(:standard))
        .to(eq(RubyNPM::Options::Types::Standard))
    end

    it 'returns provided value otherwise' do
      expect(described_class.resolve(Object))
        .to(eq(Object))
    end
  end
end
