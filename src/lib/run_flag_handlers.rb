#!/bin/env ruby
#
# Author: Eric Power

# Imports
require_relative 'exceptions.rb'

# handle_flags
#
# Takes in an array of flags, and runs the appropriate files.
def gen_commands config, flags

  unless flags.nil?
    valid_flags = Dir["#{__dir__}/../flag_handlers/*"].map{ |path|
      File.basename(path).split(".rb")[0]
    }.filter{ |flag|
      flag.to_s[/([a-z][A-Z]*)+/] or flag.to_s == "_"
    }
    commands = []

    flags.each{ |flag|
      if valid_flags.include? flag
        load "#{__dir__}/../flag_handlers/#{flag}.rb"
        config, new_commands = get_commands config

        Object.remove_method(:get_commands)
        Object.remove_method(:get_help)
        Object.remove_method(:setup_config)

        new_commands.each{  |cmd|
          commands << cmd
        }
      else
        raise NoFlagHandlerError flag
      end
    }
  end

  unless config[:state][:main_script]
      load "#{__dir__}/../flag_handlers/_.rb"

      config, commands = get_commands config

      Object.remove_method(:get_commands)
      Object.remove_method(:get_help)
      Object.remove_method(:setup_config)
  end

  [config, commands]
end
