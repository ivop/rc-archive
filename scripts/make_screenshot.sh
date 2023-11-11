#! /bin/bash

# use:  Xephyr :1 -screen 336x240

WINSIZE="-win-width 336 -win-height 240"

if [ $# != 1 ]; then
    echo "usage: make_screenshot foo.xex" >&2
    exit 1
fi

j=`basename "$1" .xex`.png

ntsc=`echo "$1" | grep -i ntsc`
if [ -n "$ntsc" ]; then
    ntsc=-ntsc
fi

winxephyr=`xwininfo -root -all | grep -i 'xephyr on' | cut -d\" -f1`

DISPLAY=:1.0 atari800.bin $ntsc $WINSIZE -nosound "$1" &

sleep 3

x11mirror-client -w $winxephyr -O -o "$j"

pkill atari800
