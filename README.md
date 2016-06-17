**NOTE: I neither use nor maintain this project anymore.**

ruby-complete
=============

Ruby-complete is a Ruby interface to the command completion functionality of Bash (essentially the `complete`
and `compgen` bash builtins -- see `man bash` for more info). It is useful if you want to make a bash
completion script but want to avoid writing actual bash code.

Installation
------------

First, you need to pick a directory for your ruby completion scripts. I like `$HOME/scripts/completion`. Edit
your `.bashrc` to specify `$RUBY_COMPLETE_DIR`:

    export RUBY_COMPLETE_DIR="$HOME/scripts/completion"

(Make sure to `source ~/.bashrc` afterwards). Now change to the directory where you downloaded the
ruby-complete source and run the installer:

    $ ./install.bash

This will put an example completion script in `$RUBY_COMPLETE_DIR`. You should also make sure that
`completion.rb`, which is the main ruby-complete script, is in your `$PATH`. Finally, you'll want to get the
completion in every shell you open; put this in `.bashrc`:

    source path/to/ruby-complete.bash

(Change this path as appropriate to point to where you downloaded ruby-complete.)

The installer script will automatically register one ruby-complete script for you: the auto-complete for
`completion.rb` itself. If you source `ruby-complete.bash` manually (or open a fresh terminal), you should be
able to type

    $ completion.rb <TAB>

and see three choices auto-completed for you: `init`, `register`, and `unregister`. Further tabbing will give
completion on sub-commands.

Usage
-----

The basic idea is that in order to have auto-completion for the command `foo`, you have to create `foo.rb` in
the directory specified by `$RUBY_COMPLETE_DIR`. After you register the command `foo` with `completion.rb`,
your completion script will be called whenever you tab-complete after typing `foo`. The completion for
`completion.rb` is hence `$RUBY_COMPLETE_DIR/completion.rb.rb`. The best way to understand how to write ruby
completion scripts is to look at this example.

Registering and unregistering a command with completion.rb is simple:

    $ completion.rb register foo
    $ completion.rb unregister foo

These commands will warn you that they will only take effect in new shells; this is because you can't really
access bash builtins such as `complete` in such a way as to affect a parent shell.

TODO:
-----

* Provide caching functionality. I'll probably write this whenever I first need it.
