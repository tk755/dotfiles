#!/usr/bin/env bash

# xrandr --output eDP-1 --mode 2560x1600
# xrandr --output eDP-1 --mode 1920x1200

case $HOSTNAME in
  kawasaki) xrandr --output eDP-1 --mode 1680x1050 ;;
  yamaha) xrandr --output eDP-1 --mode 1920x1080 ;;
esac

xrandr --output HDMI-2 --mode 2560x1440 --right-of eDP-1
