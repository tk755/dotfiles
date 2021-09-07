#!/usr/bin/env bash

# disable laptop keyboard
$HOME/bin/keyboard/auto.py

# monitor configuration
$HOME/bin/display.sh

# set background image
PIC_DIR=$(xdg-user-dir PICTURES)
feh --bg-fill $PIC_DIR/desktops/spaceman.jpeg

# launch polybar
$HOME/.config/polybar/launch.sh