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

# include path to OCaml merlin if it exists
if [[ -d $HOME/.opam/default/bin/ocamlmerlin ]] ; then
    PATH="$HOME/.opam/default/bin/ocamlmerlin:$PATH"
fi

# include path to Go binaries if it exists
if [[ -d /usr/local/go/bin ]] ; then
    PATH="/usr/local/go/bin:$PATH"
fi