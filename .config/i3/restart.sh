#!/usr/bin/env bash

BIN="$HOME/bin"

# monitor configuration
source "${BIN}/display-manager"

# set background image
source "${BIN}/background-manager"

# launch polybar
source "$HOME/.config/polybar/launch.sh"