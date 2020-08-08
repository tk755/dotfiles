#!/usr/bin/env bash
# Executed by bash for non-login shells

# return if not running interactively
case $- in
    *i*) ;;
      *) return;;
esac

# history settings
HISTSIZE=10000
HISTFILESIZE=50000
# prevent duplicate lines or lines starting with a space in history
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend
# check the window size after each command and update LINES and COLUMNS
shopt -s checkwinsize

# enable programmable completion features
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# source alias definitions
if [ -f $HOME/.bash/aliases ]; then
    source $HOME/.bash/aliases
elif [ -f $HOME/.bash_aliases ]; then
    source $HOME/.bash_aliases
fi

# source set prompt
if [ -f $HOME/.bash/prompt ]; then
    source $HOME/.bash/prompt
else
    PS1='\[\e[01;32m\]\u@\h\[\e[00m\]:\[\e[01;34m\]\w\[\e[00m\]\$ '
fi

# custom splash screen
echo \
"  ______   __  __     
 /\__  _\ /\ \/ /     
 \/_/\ \/ \ \  _'-.   
    \ \_\  \ \_\ \_\  
     \/_/   \/_/\/_/
"
