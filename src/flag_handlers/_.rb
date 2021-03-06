#!/usr/bin/env ruby
#
# Author: Eric Power
#
# Description:
#     The default handler for when no flags are set.


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
  commands << "cat @script_template.rb > #{config[:project]}/#{config[:project]}.rb"
  config[:state][:main_script] = true
  [config, commands]
end


# get_help
#
# Returns the discription of this flag (to display in the help message)
def get_help
  "Creates a simple Ruby script file (in the current directory)."
end


# setup_config
#
# Adds fields to the config file that tell other flags to include certain
# things.
def setup_config config
  config
end
