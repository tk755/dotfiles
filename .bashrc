#!/usr/bin/env bash
# Executed by bash for non-login shells

# return if not running interactively
case $- in
    *i*) ;;
      *) return;;
esac


HISTSIZE=1000000
# exclude duplicate lines and lines starting with a space in history
HISTCONTROL=ignoreboth
# exclude simple commands in history
HISTIGNORE='history:clear'
# prevent persistent history
#unset HISTFILE

# source alias definitions
if [[ -f $HOME/.bash/aliases.sh ]]; then
    source $HOME/.bash/aliases.sh
elif [[ -f $HOME/.bash_aliases ]]; then
    source $HOME/.bash_aliases
fi

# source path script
if [[ -f $HOME/.bash/path.sh ]]; then
    source $HOME/.bash/path.sh
fi

# source custom prompt
if [[ -f $HOME/.bash/prompt.sh ]]; then
    source $HOME/.bash/prompt.sh
else
    PS1='\[\e[31m\]$(printf "%03d" "\!")\[\e[00m\]|\[\e[01;32m\]\u@\h\[\e[00m\]:\[\e[01;34m\]\w\[\e[00m\]\$ '
fi

# source local configuration
if [[ -f $HOME/.bash/local.sh ]]; then
    source $HOME/.bash/local.sh
fi

# print splash text
if [[ -f $HOME/.bash/splash ]]; then
    cat $HOME/.bash/splash
    printf "\n\n"
fi
