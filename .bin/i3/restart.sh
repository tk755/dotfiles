#!/usr/bin/env bash

# disable laptop keyboard
python3 $HOME/bin/keyboard/auto.py

# monitor configuration
source $HOME/bin/dp-tk

# set background image
source $HOME/bin/bg-tk

# launch polybar
source $HOME/.config/polybar/launch.sh