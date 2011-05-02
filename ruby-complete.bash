_ruby_complete()
{
    local current index
    current="${COMP_WORDS[*]}"
    index="${COMP_CWORD}"
    COMPREPLY=( $(completion.rb ${index} ${current} ) )
    return 0
}

if [ -z "$RUBY_COMPLETE_DIR" ]; then
  echo 'Error: $RUBY_COMPLETE_DIR not defined.'
  exit 1
fi
source $RUBY_COMPLETE_DIR/registration.bash
