#!/usr/bin/env bash
# Defines bash aliases

# commands
alias title='clear; source ~/.bashrc'

# dotfiles bare repository
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# better utilities
alias mv="mv -iv"
alias cp="cp -ivr"
alias rm="rm -v"
alias mkdir="mkdir -vp"
alias rmdir="rmdir -v"

# color
alias sl='ls'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias tree='tree --dirsfirst -C'
