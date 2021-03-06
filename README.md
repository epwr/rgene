# rgene

A flexible generator for Ruby project directories. Designed to be installed as a
Gem, rgene can be told to set up a project folder however you want by using some
flags.

For example, to set up a Ruby app just run rgene with the `a` flag. This creates
a directory set up for publishing a Ruby gem (eg. a gemspec and appropriate file
structure), and a Ruby file that sets up the basic command line argument parsing
using the optparse gem.

The flags that rgene recognizes are:

- r : rake (includes commands to build a gem)
- a : app (command line app)
- t : testing framework (rspec)
- e : easy (no confirm)
- v : verbose (ask me yes/no to all the main options). error if combined with e
- b : bundler
- g : run git --init (have ability to set upstream)
- h : help. If set, print help message and exit
- l : license (default = ask, 1 = MIT, maybe a few others.)
- s : show. Show all the flags, and their options
- h : here. Build a script in this directory (or combine with `a`)

## Design Ideation

This isn't a roadmap, this is just some ideas on how to design rgene.

### Default Output

By default, I want rgene to print out the file structure of the new project in a
way that's similar to the `tree` command, and then ask for confirmation from the
user before creating the structure.

With the `e` flag this part is skipped. With the `v` flag, I want rgene to first
confirm that the options set by other flags

### Checks for valid project name

If the project is `.` or starts with `..`, then this should be caught. If run in
`e` mode, throw error and exit. If in default mode, or `v`, and the project name
is `../NAME` then confirm that the user wants to create a project with `NAME` in
the parent directory.

### Should be easy to extend

Not really sure how this looks, but need to think about it. Some modes will need
to interact, some wont.

So maybe a lookup like:

    ```ruby
    [
      ['a' , gen_gem_stuff]
      ['r' , gen_rake_stuff]
      ['ra', replace_gemspec_with_rake_built_stuff]
    ]
    ```

Where it iterates through, and calls the functions when flags match. Another way
would be to have each flag match only the most complex flag group. So `ra` would
call the function for `ra`, but not the function for `r` or `a`.

Note: Go with the second way above - because when building the rakefile, we need
to know that the `rake gem:build` option needs to exist.

`/ra/` is more specific than `/r/` or `/a/`, and because `r2` does not match any
patterns with only `r` there is no need to worry about whether a `/r2a/` flag or
a `/ra2/` flag should be called.

### Functional Design

There should be a function for each option. The function should return a list of
strings that would be run to generate the folder structure when run as commands.
Maybe have `"cat @/assets/template.gemspec > project/project.gemspec"` where the
@ symbol is actually turned into the path to the assets folder.

### Capital Flags Specify options

Eventually, it would be nice to allow `rgene rGate` to set the project up with a
different Rakefile than `rgene rate` would. Disallowing (to start) capital
letters to be used as flags would allow this to be added later on.
