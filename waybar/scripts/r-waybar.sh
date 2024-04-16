#!/usr/bin/env bash

if [[ $(pgrep -x "waybar") == "waybar" ]]; then
    killall waybar
else
if [[ $(pgrep -x "waybar") == "" ]]; then
    waybar -c $CONFIG -s $STYLE > /dev/null 2>&1 &
fi
fi

