#!/usr/bin/env bash
# ~/.bashrc is executed by bash for non-login shells

# return if not running interactively
case $- in
    *i*) ;;
      *) return;;
esac

# alias definitions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

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

# set variable identifying the chroot you work in (used in the prompt)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set prompt
PS1='${debian_chroot:+($debian_chroot)}\[\e[01;35m\][\t] \[\e[01;32m\]\u@\h\[\e[00m\]:\[\e[01;34m\]\w\[\e[00m\]\$ '

# set powerline prompt
#enable_powerline=yes
if [ -f `which powerline-daemon` ] && [ -n "$enable_powerline" ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/share/powerline/bindings/bash/powerline.sh
fi

# custom splash screen
echo "
 ______   __  __     
/\__  _\ /\ \/ /     
\/_/\ \/ \ \  _'-.   
   \ \_\  \ \_\ \_\  
    \/_/   \/_/\/_/
"
