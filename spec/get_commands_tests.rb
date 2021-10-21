# Tests for the functions that run the flag handlers (not the functions in the
# test handlers themselves).

# Imports
require_relative '../src/lib/get_commands'

describe "Command Generator (gen_commands from run_flag_handlers.rb)" do

  before(:context) do

  end

  it "should be able to list build a project with no flags." do
    config = {
      project: 'test_prj',
      state: {},
      request: {}}
    expect(gen_commands(config, nil)[1]).to eq(["mkdir test_prj",
                            "cat @script_template.rb > test_prj/test_prj.rb"])
  end

  # it "should be able to build a project using the `a` flag." do
  #   config = {
  #     project: 'test_prj',
  #     state: {},
  #     request: {}}
  #   expect(gen_commands(config, 'a')[1]).to eq(["mkdir test_prj",
  #                           "cat @app_template.rb > test_prj/test_prj.rb"])
  # end

  it "should not leave the get_commands and get_help functions defined." do
    config = {
      project: 'test_prj',
      state: {},
      request: {}}
    gen_commands config, nil
    expect(defined? get_commands).to be_falsey
    expect(defined? get_help).to be_falsey
  end

end
