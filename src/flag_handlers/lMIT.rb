#!/usr/bin/env ruby
#
# Author: Eric Power
#
# Description:
#     The handler for the `lMIT` flag. Sets up the project to include the MIT
#     License in it's root.


# get_commands
#
# Returns [config, commands] where commands are an array of strings that tell
# rgene how to set up the project.
def get_commands config
  commands = []
  if not config[:state][:dir_made]
    commands << "mkdir #{config[:project]}"
    config[:state][:dir_made] = true
  end
  commands << "cat @license_MIT.rb > #{config[:project]}/LICENSE"
  [config, commands]
end


# get_help
#
# Returns the discription of this flag (to display in the help message)
def get_help
  "Creates an MIT License in the project root."
end


# setup_config
#
# Adds fields to the config file that tell other flags to include certain
# things.
def setup_config config
  config[:r_license] = "MIT"
  config[:request][:name] = true  # req_ configurations require user input.
end
