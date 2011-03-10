#!/bin/bash

if [ -z "$RUBY_COMPLETE_DIR" ]; then
  RUBY_COMPLETE_DIR="$HOME/ruby-completion-scripts"
fi

if [ -e "ruby-complete.bash" -o -e "completion.rb" ]; then
  echo "Error: ruby-complete.bash and completion.rb should not already exist in this directory."
  exit 1
fi

wget --no-check-certificate https://github.com/cespare/ruby-complete/raw/master/ruby-complete.bash
if [ $? -ne 0 ]; then
  echo "Error downloading ruby-complete.bash."
  exit 1
fi

wget --no-check-certificate https://github.com/cespare/ruby-complete/raw/master/completion.rb
if [ $? -ne 0 ]; then
  echo "Error downloading completion.rb."
  exit 1
fi

chmod +x completion.rb

wget -O $RUBY_COMPLETE_DIR/completion.rb.rb --no-check-certificate https://github.com/cespare/ruby-complete/raw/master/completion.rb.rb
if [ $? -ne 0 ]; then
  echo "Error downloading completion.rb.rb."
  exit 1
fi

./completion.rb init
./completion.rb register completion.rb

echo "Installation successful. Now make sure you source ruby-complete.bash (in this directory) in your .bashrc."
echo 'Example (assuming you just installed into $HOME/scripts/):'
echo
echo '    source $HOME/scripts/ruby-complete.bash'
echo
