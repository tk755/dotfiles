#!/usr/bin/env bash
# Executed by bash for non-login shells

# return if not running interactively
case $- in
    *i*) ;;
      *) return;;
esac


HISTSIZE=1000000
# ignore duplicate lines and lines starting with a space in history
HISTCONTROL=ignoreboth
# prevent persistent history
unset HISTFILE

# source alias definitions
if [[ -f $HOME/.bash/aliases ]]; then
    source $HOME/.bash/aliases
elif [[ -f $HOME/.bash_aliases ]]; then
    source $HOME/.bash_aliases
fi

# source path
if [[ -f $HOME/.bash/path ]]; then
    source $HOME/.bash/path
fi

# source prompt
if [[ -f $HOME/.bash/prompt ]]; then
    source $HOME/.bash/prompt
else
    PS1='\[\e[31m\]$(printf "%03d" "\!")\[\e[00m\]|\[\e[01;32m\]\u@\h\[\e[00m\]:\[\e[01;34m\]\w\[\e[00m\]\$ '
fi

# print splash text
if [[ -f $HOME/.bash/splash ]]; then
    cat $HOME/.bash/splash
    printf "\n\n"
fi
