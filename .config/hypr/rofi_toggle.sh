#!/bin/bash

# Check if rofi is running
if pgrep -x "rofi" > /dev/null; then
    # Kill rofi if it's running
    pkill rofi
else
    # Launch rofi if it's not running
    rofi -show drun
fi
