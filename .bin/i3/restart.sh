#!/usr/bin/env bash

# disable laptop keyboard
python3 $HOME/bin/keyboard/auto.py

# set background image
PIC_DIR=$(xdg-user-dir PICTURES)
feh --bg-fill $PIC_DIR/desktops/spaceman.jpeg

# monitor configuration
source $HOME/bin/kawasaki/display.sh

# launch polybar
source $HOME/.config/polybar/launch.sh