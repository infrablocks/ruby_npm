# frozen_string_literal: true

shared_examples(
  'a command with an argument'
) do |command_klass, subcommand, argument|
  it_behaves_like(
    'a valid command line',
    command_klass,
    reason:
      "calls the npm #{subcommand} command passing the supplied " \
      "#{argument} value",
    expected: "npm #{subcommand} argument-value",
    binary: 'npm',
    parameters: {
      argument => 'argument-value'
    }
  )
end
