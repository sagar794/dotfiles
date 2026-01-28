export EDITOR=nvim

alias vim="nvim"
alias v="nvim"

# Ignore duplicate and blank history commands 
setopt hist_ignore_all_dups
setopt hist_reduce_blanks

# Fuzzy Search
source /usr/share/fzf/key-bindings.zsh

# Completions
fpath=(/usr/share/zsh/site-functions $fpath)
autoload -Uz compinit
compinit

# Prompt
autoload -U promptinit; promptinit
prompt pure

