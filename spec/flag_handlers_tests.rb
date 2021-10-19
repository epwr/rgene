# Tests for the flag handlers, specifically the get_commands and get_help
# commands for each of the core (distributed in the gem) flag handlers.

describe "Flag Handler: _.rb" do

  before(:context) do
    load "#{__dir__}/../src/flag_handlers/_.rb"
  end

  it "should create a Ruby file from @script_template." do
    config = {project: 'test_prj'}
    new_config, commands = get_commands(config, nil)
    expect(new_config).to eq(config)
    expect(commands).to eq(["cat @script_template.rb > test_prj.rb"])
  end

  after(:context) do
    Object.remove_method(:get_commands)
    Object.remove_method(:get_help)
  end

end
