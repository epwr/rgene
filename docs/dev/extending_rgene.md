# Extending rgene

If you're planning on extending `rgene`, the easiest way to do this is by making
a new flag combination handler, and adding it to `/src/lib/handlers`. It's worth
looking through some of the pre-existing files in that directory to see how they
are structured, and how they behave, but this file covers the behaviour they are
expected to follow to work with the rest of rgene.

# Basic Concepts

## Basic Concept of Flag Handlers

The basic idea, is that there is one ruby file that handles each flag, or unique
combination of flags. So there's a file called `r.rb` that handles the `r` flag.
There is also a file `ar.rb` that handles generating the relevant files when `a`
and `r` are both set. If `a` and `r` are both set, then neither `r.rb` or `a.rb`
are called, because it's expected that only the most specific handler is called.

Each file then provides two functions:

  - `get_instructions` which takes one argument: a Hash that holds configuration
    values. This function returns an Array of two variables: a Hash with the new
    configuration values, and a list of strings that are essentially sh commands
    (see Section called Format of Command Strings for more details).
  - `get_help` which takes no arguments and returns a string containing a simple
    description of what the handler does (this is displayed in help message).

Handlers can have other functions that serve as helper functions to one, or both
, of these functions.

## Basic Contract

Keep in mind the following contract when building new Handlers. For more details
on why these rules exists, and what they mean, read the Sections in "Details for
Developing new Handlers".

  - Take in a configuration Hash and return an updated configuration Hash, and a
    list of commands.
  - Keep your handler pure (eg. don't directly call commands, only return them).
  - Only create files using the `touch` command, or by directing input using the
    `>` or `>>` operators.

# Details for Developing new Handlers

## Format of Command Strings

The command strings that a handler returns must be valid sh commands. But to let
`rgene` easily understand which files will t

## Naming of Handlers

The name of the handler should be the flag(s) that it handles in alpha-numerical
order (letters come before numbers). So a handler for the flags `lMIT`,  `a` and
`r` should be named `alMITr.rb`. See the Section called "How rgene decides which
Handler Files to call" for more details on how rgene parses flags.

## How rgene decides which Handler Files to call



## Details on the Configuration Hash
