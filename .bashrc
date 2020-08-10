#!/usr/bin/env bash
# Executed by bash for non-login shells

# return if not running interactively
case $- in
    *i*) ;;
      *) return;;
esac

# prevent persistent history
unset HISTFILE
HISTSIZE=1000000

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
