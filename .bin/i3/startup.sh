#!/usr/bin/env bash

# launch bluetooth adapter
/usr/bin/blueman-applet

# launch dropbox
dropbox start

# launch xss-lock
xss-lock -- $HOME/bin/i3/lock.sh