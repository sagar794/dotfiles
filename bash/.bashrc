#
# ~/.bashrc
#

export PATH=$PATH:$HOME/bin
export EDITOR=nvim

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias vim="nvim"
alias v="nvim"
PS1='[\u@\h \W]\$ '
