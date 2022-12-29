# frozen_string_literal: true

shared_examples(
  'a command with an argument array'
) do |command_klass, subcommand, argument|
  it_behaves_like(
    'a valid command line',
    command_klass,
    reason:
      "calls the npm #{subcommand} command passing no arguments " \
      "when #{argument} not provided",
    expected: "npm #{subcommand}",
    binary: 'npm',
    parameters: {}
  )

  it_behaves_like(
    'a valid command line',
    command_klass,
    reason:
      "calls the npm #{subcommand} command passing no arguments " \
      "when #{argument} is empty",
    expected: "npm #{subcommand}",
    binary: 'npm',
    parameters: {
      argument => []
    }
  )

  it_behaves_like(
    'a valid command line',
    command_klass,
    reason:
      "calls the npm #{subcommand} command passing the supplied value k=v " \
      "from #{argument}",
    expected: "npm #{subcommand} k=v",
    binary: 'npm',
    parameters: {
      argument => ['k=v']
    }
  )

  it_behaves_like(
    'a valid command line',
    command_klass,
    reason:
      "calls the npm #{subcommand} command passing the supplied values " \
      "k1=v1, k2=v2 from #{argument}",
    expected: "npm #{subcommand} k1=v1 k2=v2",
    binary: 'npm',
    parameters: {
      argument => %w[k1=v1 k2=v2]
    }
  )
end
