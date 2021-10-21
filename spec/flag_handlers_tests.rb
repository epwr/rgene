# Tests for the flag handlers, specifically the get_commands and get_help
# commands for each of the core (distributed in the gem) flag handlers.


# TODO: Change all the X.rb - Falg Handler 'describe' blocks into a context for
# each file. Then use before(:context) to load file, after(:context) to remove
# definitions, and before(:each) to set up a basic config.

describe "All Flag Handlers" do

  it "should have get_commands and get_help functions" do
    files = Dir.entries("#{__dir__}/../src/flag_handlers/").filter { |file|
      file.include? ".rb"}
    files.each{ |file|
      load "#{__dir__}/../src/flag_handlers/#{file}"

      expect(defined? get_commands).to be_truthy
      expect(defined? get_help).to be_truthy
      expect(defined? setup_config).to be_truthy

      Object.remove_method(:get_commands)
      Object.remove_method(:get_help)
      Object.remove_method(:setup_config)
    }
  end

end


describe "_.rb - Flag Handler" do

  before(:context) do
    load "#{__dir__}/../src/flag_handlers/_.rb"
  end

  it "should create a Ruby file from @script_template." do
    config = {
      project: 'test_prj',
      state: {},
      request: {}}
    new_config, commands = get_commands(config)

    config[:state][:dir_made] = true
    expect(new_config).to eq(config)
    expect(commands).to eq(["mkdir test_prj",
                            "cat @script_template.rb > test_prj/test_prj.rb"])
  end

  if "should not change the default state" do
    config = {
      project: 'test_prj',
      state: {},
      request: {}}
    new_config = setup_config config
    expect(new_config).to eq(config)
  end

  after(:context) do
    Object.remove_method(:get_commands)
    Object.remove_method(:get_help)
    Object.remove_method(:setup_config)
  end

end



describe "a.rb - Flag Handler" do

  before(:context) do
    load "#{__dir__}/../src/flag_handlers/a.rb"
  end

  it "should create a Ruby file from @app_template." do
    config = {
      project: 'test_prj',
      state: {},
      request: {}}
    new_config, commands = get_commands(config)

    config[:state][:dir_made] = true
    expect(new_config).to eq(config)
    expect(commands).to eq(["mkdir test_prj",
                            "cat @app_template.rb > test_prj/test_prj.rb"])
  end

  if "should not change the default state" do
    config = {
      project: 'test_prj',
      state: {},
      request: {}}
    new_config = setup_config config
    expect(new_config).to eq(config)
  end

  after(:context) do
    Object.remove_method(:get_commands)
    Object.remove_method(:get_help)
    Object.remove_method(:setup_config)
  end

end



describe "r.rb - Flag Handler" do

  before(:context) do
    load "#{__dir__}/../src/flag_handlers/r.rb"
  end

  it "should create a Rakefile from a .erb in assets." do
    config = {
      project: 'test_prj',
      state: {},
      request: {}}
    new_config, commands = get_commands(config)

    config[:state][:dir_made] = true
    expect(new_config).to eq(config)
    expect(commands).to eq(["mkdir test_prj",
                            "cat @r_Rakefile.erb > test_prj/Rakefile"])
  end

  if "should not change the default state" do
    config = {
      project: 'test_prj',
      state: {},
      request: {}}
    new_config = setup_config config
    expect(new_config).to eq(config)
  end

  after(:context) do
    Object.remove_method(:get_commands)
    Object.remove_method(:get_help)
    Object.remove_method(:setup_config)
  end

end


describe "lMIT.rb - Flag Handler" do

  before(:context) do
    load "#{__dir__}/../src/flag_handlers/lMIT.rb"
  end

  it "should create a Ruby file from @app_template." do
    config = {
      project: 'test_prj',
      state: {},
      request: {}}
    new_config, commands = get_commands(config)

    config[:state][:dir_made] = true
    expect(new_config).to eq(config)
    expect(commands).to eq(["mkdir test_prj",
                            "cat @license_MIT > test_prj/LICENSE"])
  end

  if "should add some fields to the default state" do
    config = {
      project: 'test_prj',
      state: {},
      request: {}}
    new_config = setup_config config
    expect(new_config).to eq(config)
  end

  after(:context) do
    Object.remove_method(:get_commands)
    Object.remove_method(:get_help)
    Object.remove_method(:setup_config)
  end

end
