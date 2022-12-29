# frozen_string_literal: true

shared_examples(
  'a command with output options'
) do |command_klass, subcommand|
  %i[
    field
    format
  ].each do |option|
    it_behaves_like(
      'a command with an option',
      command_klass, subcommand, option
    )
  end
end
