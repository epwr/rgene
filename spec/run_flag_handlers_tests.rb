

# Imports
require_relative '../src/lib/run_flag_handlers'

describe "Flag Handler" do

  before(:context) do

  end

  it "should be able to list commands to create a simple ruby script." do
    config = {
      project: 'test_prj',
    }
    expect(gen_commands(config, nil)[1]).to eq(["cat @script_template.rb > test_prj.rb"])
  end


end
