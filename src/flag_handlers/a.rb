#!/usr/bin/env ruby
#
# Author: Eric Power
#
# Description:
#     The handler for the `a` flag. Sets up a command line app using the
#     optparse gem for parsing ARGV, and a gem set up.


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
  commands << "cat @app_template.rb > #{config[:project]}/#{config[:project]}.rb"
  [config, commands]
end


# get_help
#
# Returns the discription of this flag (to display in the help message)
def get_help
  "Sets up a command line application with optparse (in the current directory)."
end


# setup_config
#
# Adds fields to the config file that tell other flags to include certain
# things.
def setup_config config
  config
end
