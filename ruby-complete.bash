_ruby_complete()
{
    local current index
    current="${COMP_WORDS[*]}"
    index="${COMP_CWORD}"
    COMPREPLY=( $(completion.rb ${index} ${current} ) )
    return 0
}

#export RUBY_COMPLETE_DIR="$HOME/scripts/completion"

export RUBY_COMPLETE_DIR="$HOME/Projects/ruby-complete"
export PATH=$PATH:./

export RUBY_COMPLETE_CACHE_DIR="$RUBY_COMPLETE_DIR/cache"
source $RUBY_COMPLETE_DIR/registration.bash
