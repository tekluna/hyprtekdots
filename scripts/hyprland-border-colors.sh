#!/bin/bash

# Path to pywal colors
COLORS_FILE="$HOME/.cache/wal/colors"

# Check if colors file exists
if [[ ! -f "$COLORS_FILE" ]]; then
    echo "Pywal colors file not found at $COLORS_FILE"
    exit 1
fi

# Read colors from pywal
mapfile -t colors < "$COLORS_FILE"

# Extract colors (remove # if present)
color0=${colors[0]#\#}  # background
color1=${colors[1]#\#}  # red
color2=${colors[2]#\#}  # green  
color3=${colors[3]#\#}  # yellow
color4=${colors[4]#\#}  # blue
color5=${colors[5]#\#}  # magenta
color6=${colors[6]#\#}  # cyan
color7=${colors[7]#\#}  # foreground

# Apply border colors to Hyprland
hyprctl keyword general:col.active_border "rgb($color1)" # rgb($color5) 45deg
hyprctl keyword general:col.inactive_border "rgb($color0)"

# Optional: Also update group border colors
hyprctl keyword group:col.border_active "rgb($color2)"
hyprctl keyword group:col.border_inactive "rgb($color0)"

echo "Hyprland border colors updated with pywal colors!"
echo "Active border: $color1" # -> $color5
echo "Inactive border: $color0"
