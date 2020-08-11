#!/usr/bin/env bash
# Defines PATH environment variable

export PATH=$PATH

# include user's private bin if it exists
if [[ -d $HOME/bin ]] ; then
    PATH="$HOME/bin:$PATH"
fi

# include user's private bin if it exists
if [[ -d $HOME/.local/bin ]] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
