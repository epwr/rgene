#!/usr/bin/env ruby
#
# Author: Eric Power
#
# Description:
#     The default handler for when no flags are set.

# get_commands
#
#
def get_commands config
  [config, ["cat @script_template.rb > #{config[:project]}.rb"]]
end

# get_help
#
#
def get_help
  "Creates a simple Ruby script file."
end
