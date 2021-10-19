

# Imports
require_relative '../src/lib/flag_handler'

describe "Flag Handler" do

  before(:context) do

  end

  it "should be able to list commands to create a simple ruby script." do
    config = {
      gen_defaults: true,
      make_directory: false,
      project: 'test_prj',
    }
    expect(gen_commands(config, nil)[1]).to eq(["cat @simple_script.erb > test_prj.rb"])
  end

  it "should be able to list commands to create a project directory and simple script." do
    config = {
      gen_defaults: true,
      make_directory: true,
      project: 'test_prj',
    }
    expect(gen_commands(config, nil)[1]).to eq(["mkdir test_prj", "cat @simple_script.erb > test_prj/test_prj.rb"])
  end


end
