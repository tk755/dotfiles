#!/usr/bin/env bash

ICON=$HOME/pics/icons/lock.png
TMPBG=/tmp/TMPBG.png

maim -u $TMPBG
convert $TMPBG -scale 4% -scale 2500% $TMPBG
convert $TMPBG $ICON -gravity center -composite -matte $TMPBG
i3lock -u -e -b -i $TMPBG
