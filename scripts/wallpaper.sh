#!/bin/bash

# while true; do
#     echo "Do you wish to select your own path for your wallpaper or use the defaul [~/Pictures/tek_wallpapers/]?"
#     select yn in "default" "own"; do
#         case $yn in
#             default ) $WALLPAPER_DIR="https://github.com/caelestia-dots/shell" ;;
#             own ) echo "Select path you wish to use" pathinput
#                 WALLPAPER_DIR=pathinput
#                     if (!pathinput) do 
#                         echo "Path does not exist. Exiting..."
#                         exit
#                     fi
#                 else
#                     echo "You've succesfully selected path ${pathinput}"
#                     echo "I will now procede to convert every picture in the selected path to PNG. You will then be able to select your desired wallpaper."
#                     read -p "do you wish to procede? (Y/n)" yn




WALLPAPER_DIR="$HOME/Pictures/tek_wallpapers"
SELECTED_FILE= "selected.png"
PREVIOUS= "previous.png"
COLORS_FILE="$HOME/.cache/wal/colors"

echo "gate 1"
if [ ! -d "$WALLPAPER_DIR" ]; then
    echo "Error: Wallpaper directory $WALLPAPER_DIR not found!"
    exit 1
fi
cd $WALLPAPER_DIR || exit 1

for file in *; do
    if [[ "$file" != *.png ]]; then
        ffmpeg -i "$file" "${file%.*}.png" -y
    fi
done

mapfile -t wallpapers < <(find . -maxdepth 1 -name "*.png" -not -name "$SELECTED_FILE" -type f | sed 's|^\./||' | sort)
if [ ${#wallpapers[@]} -eq 0 ]; then
    echo "No JPEG wallpapers found in $WALLPAPER_DIR"
    exit 1
fi

selected_wallpaper=$(printf '%s\n' "${wallpapers[@]}" | wofi --dmenu --prompt "Select wallpaper:")
if [ -z "$selected_wallpaper" ]; then
    echo "No wallpaper selected. Exiting."
    exit 0
fi

if [ -z "$selected_wallpaper" ]; then
    echo "No wallpaper selected. Exiting."
    exit 0
fi
if [ ! -f "$selected_wallpaper" ]; then
    echo "Error: Selected file $selected_wallpaper not found!"
    exit 1
fi

echo "Files $selected_wallpaper will now be set as your wallpaper..."

if [ -f "$PREVIOUS"]; then
    rm $PREVIOUS
fi
cp selected.png previous.png
cp $selected_wallpaper selected.png

echo "Restarting swww daemon..."
pkill swww-daemon 
swww-daemon &

echo "Changing wallpaper with swww..."
swww img $WALLPAPER_DIR/selected.png --transition-type fade --transition-duration 4

echo "Syncing color scheme with pywall..."
wal -i selected.png --saturate 0.4

echo "Restarting waybar"
pkill waybar
waybar &


if [[ ! -f "$COLORS_FILE" ]]; then
    echo "Pywal colors file not found at $COLORS_FILE"
    exit 1
fi

mapfile -t colors < "$COLORS_FILE"
color0=${colors[0]#\#}  # background
color1=${colors[1]#\#}  # red
color2=${colors[2]#\#}  # green  
color3=${colors[3]#\#}  # yellow
color4=${colors[4]#\#}  # blue
color5=${colors[5]#\#}  # magenta
color6=${colors[6]#\#}  # cyan
color7=${colors[7]#\#}  # foreground

hyprctl keyword general:col.active_border "rgb($color1)" # rgb($color5) 45deg
hyprctl keyword general:col.inactive_border "rgb($color0)"

# hyprctl keyword group:col.border_active "rgb($color2)"
# hyprctl keyword group:col.border_inactive "rgb($color0)"

