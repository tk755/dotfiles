#!/usr/bin/env bash

function stop() {
    if pgrep dunst ; then
        pkill dunst # terminate dunst 
    fi
}

function start() {
    dunst &
    if pgrep dunst ; then
        notify-send "dunst" "dunst launched successfully!" -u low
    else
        notify-send "dunst" "dunst failed to launch!" -u critical
    fi
}

stop

start