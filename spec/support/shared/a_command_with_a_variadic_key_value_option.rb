# frozen_string_literal: true

shared_examples(
  'a command with a variadic key-value option'
) do |command_klass, subcommand, option|
  singular = option.to_s.chop
  singular_option = singular.to_sym
  name = "-#{singular.sub('_', '-')}"

  it_behaves_like(
    'a valid command line',
    command_klass,
    reason: "adds a #{name} option for each key/value pair provided",
    expected:
      "npm #{subcommand} #{name}='thing=blah' #{name}='other=wah'",
    binary: 'npm',
    parameters: {
      option => { thing: 'blah', other: 'wah' }
    }
  )

  it_behaves_like(
    'a valid command line',
    command_klass,
    reason: "ignores the #{singular} option",
    expected:
      "npm #{subcommand}",
    binary: 'npm',
    parameters: {
      singular_option => 'value'
    }
  )
end
