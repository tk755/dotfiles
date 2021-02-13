#!/usr/bin/env bash

# disable laptop keyboard
python3 $HOME/bin/keyboard/auto.py

# monitor configuration
source $HOME/bin/kawasaki/display.sh

# set background image
source $HOME/bin/kawasaki/bg.sh

# launch polybar
source $HOME/.config/polybar/launch.sh