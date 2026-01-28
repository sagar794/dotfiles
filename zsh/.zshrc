export EDITOR=nvim

alias vim="nvim"
alias v="nvim"

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt append_history
setopt share_history

# Fuzzy Search
source /usr/share/fzf/key-bindings.zsh

ff() {
  cd "$(fd --type d --max-depth 1 . "$HOME/Projects" | fzf)"
}

# Completions
fpath=(/usr/share/zsh/site-functions $fpath)
autoload -Uz compinit
compinit

# Prompt
autoload -U promptinit; promptinit
prompt pure

