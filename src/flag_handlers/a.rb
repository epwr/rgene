#!/usr/bin/env ruby
#
# Author: Eric Power
#
# Description:
#     The handler for the `a` flag. Sets up a command line app using the
#     optparse gem for parsing ARGV, and a gem set up.

# get_commands
#
#
def get_commands config
  [config, ["cat @app_template.rb > #{config[:project]}.rb"]]
end

# get_help
#
#
def get_help
  "Sets up a command line application with optparse (in the current directory)."
end
