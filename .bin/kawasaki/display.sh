#!/usr/bin/env bash

# xrandr --output eDP-1 --mode 2560x1600
# xrandr --output eDP-1 --mode 1920x1200
xrandr --output eDP-1 --mode 1680x1050

xrandr --output HDMI-2 --mode 2560x1440 --left-of eDP-1
