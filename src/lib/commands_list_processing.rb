#!/bin/env ruby
#
# Author: Eric Power

# Imports
require_relative 'exceptions.rb'
require 'set'


# validate_command_list
#
# Takes the list of commands and checks for obvious issues with it. Specifically
# looks for:
#   - Duplicate commands
#   - Commands that might overwrite each other
#
# Returns [errors, warnings, file_tree]
def validate_command_list commands

  cmd_hash = Set[]
  file_hash = Set[]
  dir_hash = Set[]

  commands.each { |cmd|

    # Check if cmd is a duplicate cmd
    raise DuplicateCommandError if cmd_hash.include? cmd
    cmd_hash.add cmd

    # Check if the command might overwrite something else
    cmd_tokens = cmd.split(" ")

    # TODO: need a custom lexer to deal with `echo ">> hello!"`
    # What I think this should become is a lexer that breaks things into tokens
    # (handles escape characters and strings (eg. "file name with spaces.html"))
    #
    # Then, break filenames from src/lib/file.rb into
    # fstruct['src']['lib']['file.rb']
    #
    # Then this fstruct can be returned as the tree, and when adding/deleting
    # files we can check that they would exist at a valid path.
    #


    if cmd_tokens[0] == "touch" # Adding a file
      cmd_tokens[1..].each { |dir|
        file_hash.add dir
      }
    elsif cmd_tokens[0] == "mkdir" # Adding a directory
      cmd_tokens[1..].each { |dir|
        dir_hash.add dir
      }
    elsif cmd_tokens[0] == "rm" # properly removing a file
      cmd_tokens[1..].each{ |file|
        file_hash.remove file
      }
    elsif cmd_tokens.include? ">"
      raise OverwrittingFileError if file_hash.include? tokens[-1] # TODO: does `echo 'hello' > file1 file2` do something?
      file_hash.add cmd_tokens[-1]
    elsif cmd_tokens.include? ">>"
      file_hash.add cmd_tokens[-1]
    end
  }
end
