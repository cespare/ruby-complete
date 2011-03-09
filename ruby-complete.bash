_ruby_complete()
{
    local current index
    current="${COMP_WORDS[*]}"
    index="${COMP_CWORD}"
    COMPREPLY=( $(completion.rb ${index} ${current} ) )
    return 0
}

export RUBY_COMPLETE_DIR=$HOME/scripts/completion
