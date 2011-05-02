#!/bin/sh

set -e

if [ -z "$RUBY_COMPLETE_DIR" ]; then
  echo 'Error: $RUBY_COMPLETE_DIR must be defined (put it in your bashrc).'
  echo 'Example:'
  echo '  export $RUBY_COMPLETE_DIR=$HOME/ruby-complete'
  exit 1
fi

if [ ! -e "$RUBY_COMPLETE_DIR" ]; then
  echo "Error: $RUBY_COMPLETE_DIR does not exist."
  exit 1
fi

chmod +x completion.rb

cp completion.rb.rb $RUBY_COMPLETE_DIR/

./completion.rb init
./completion.rb register completion.rb

echo "Installation successful. Now make sure you source ruby-complete.bash (in this directory) in your .bashrc."
echo 'Example (assuming you just installed into $HOME/scripts/):'
echo
echo '    source $HOME/scripts/ruby-complete.bash'
echo
