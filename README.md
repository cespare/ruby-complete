ruby-complete
=============

Ruby-complete is a Ruby interface to the command completion functionality of Bash (essentially the `complete`
and `compgen` bash builtins -- see `man bash` for more info). It is useful if you want to make a bash
completion script but want to avoid writing actual bash code.

Installation
------------

First, you'll need to pick two different directories -- one for a couple of executables you'll download, and
one for any ruby completion scripts you write. You have to pick the first yourself; I like `$HOME/scripts/`
for this purpose (it should be in your path). The second will default to `$HOME/ruby-completion-scripts/`. In
our example, we'll suppose we want something different: `$HOME/scripts/completion`.

First, edit your `.bashrc` to specify `$RUBY_COMPLETE_DIR`, the home for your ruby-complete scripts:

    export RUBY_COMPLETE_DIR="$HOME/scripts/completion"

(Make sure to `source ~/.bashrc` afterwards). Now change to the chosen scripts directory and run my handy
installer script:

    $ cd $HOME/scripts
    $ curl https://github.com/cespare/ruby-complete/raw/master/install.bash | bash

This should install the executable scripts into `$HOME/scripts/` and put an example completion script in
`$HOME/scripts/completion/`. Finally, you'll want to get the completion in every shell you open; put this in
`.bashrc`:

    source $HOME/scripts/ruby-complete.bash

(Remember to change the appropriate paths if you want to install to a location other than `$HOME/scripts/`.)

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
