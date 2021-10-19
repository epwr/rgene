#!/bin/env ruby
#
# Author: Eric Power

# Imports
require_relative 'exceptions.rb'

# handle_flags
#
# Takes in an array of flags, and runs the appropriate files.
def gen_commands config, flags

  if flags.nil?
      load "#{__dir__}/../flag_handlers/_.rb"
  else
    raise NotImplementedError
  end

  config, commands = get_commands config

  Object.remove_method(:get_commands)
  Object.remove_method(:get_help)

  [config, commands]

end
