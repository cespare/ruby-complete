_ruby_complete()
{
    local cur prev
    current="${COMP_WORDS[*]}"
    index="${COMP_CWORD}"
    COMPREPLY=( $(./completion.rb ${index} ${current} ) )
    return 0
}

