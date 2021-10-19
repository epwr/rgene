# rgene Errors

The `rgene` gem create a few custom Errors which are used to have `rgene` handle
telling the user what went wrong. Specifically, they are:

## RGeneError

This is the base class for the other errors. This can be thrown when there is no
better (more specific) error in this list to throw. Ensure that when you want to
raise one of these, you pass it a descriptive message about what went wrong, and
what the user can do to fix it.

## DirectoryExistsError

A flag handler should not throw this. This error is thrown when `rgene` sees the
`mkdir` command being called when that directory already exists. `rgene` then
explains to the user that a certain flag's handler tried to create a directory
that already exists.
