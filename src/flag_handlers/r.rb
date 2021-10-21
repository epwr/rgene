#!/usr/bin/env ruby
#
# Author: Eric Power
#
# Description:
#     The handler for the `r` flag. Sets up a Rakefile that has a gem: namespace
#      which can be used to build, install, and push a gem.


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
  commands << "cat @r_Rakefile.erb > #{config[:project]}/Rakefile"
  [config, commands]
end


# get_help
#
# Returns the discription of this flag (to display in the help message)
def get_help
  "Sets up a Rakefile with the basics, including commands to publish a Gem."
end


# setup_config
#
# Adds fields to the config file that tell other flags to include certain
# things.
def setup_config config
  config
end
