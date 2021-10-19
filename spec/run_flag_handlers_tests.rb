

# Imports
require_relative '../src/lib/run_flag_handlers'

describe "FCommand Generator (gen_commands from run_flag_handlers.rb)" do

  before(:context) do

  end

  it "should be able to list commands to create a simple ruby script." do
    config = {project: 'test_prj'}
    expect(gen_commands(config, nil)[1]).to eq(["cat @script_template.rb > test_prj.rb"])
  end

  it "should not leave the get_commands and get_help functions defined." do
    config = {project: 'test_prj'}
    gen_commands config, nil
    expect(defined? get_commands).to be_falsey
    expect(defined? get_help).to be_falsey
  end

end
