#!/bin/bash

# Wallpaper selector script using wofi
# Selects wallpaper, renames to selected.jpeg, restarts swww, runs wal

WALLPAPER_DIR="$HOME/hyprtekdots/wallpapers/"
SELECTED_FILE="selected.jpeg"

# Check if wallpaper directory exists
if [ ! -d "$WALLPAPER_DIR" ]; then
    echo "Error: Wallpaper directory $WALLPAPER_DIR not found!"
    exit 1
fi

# Change to wallpaper directory
cd "$WALLPAPER_DIR" || exit 1

# Get list of jpeg files (excluding selected.jpeg)
mapfile -t wallpapers < <(find . -maxdepth 1 -name "*.jpeg" -not -name "$SELECTED_FILE" -type f | sed 's|^\./||' | sort)

# Check if there are any wallpapers
if [ ${#wallpapers[@]} -eq 0 ]; then
    echo "No JPEG wallpapers found in $WALLPAPER_DIR"
    exit 1
fi

# Use wofi to select wallpaper
selected_wallpaper=$(printf '%s\n' "${wallpapers[@]}" | wofi --dmenu --prompt "Select wallpaper:")

# Check if user made a selection
if [ -z "$selected_wallpaper" ]; then
    echo "No wallpaper selected. Exiting."
    exit 0
fi

# Check if the selected file exists
if [ ! -f "$selected_wallpaper" ]; then
    echo "Error: Selected file $selected_wallpaper not found!"
    exit 1
fi

# If selected.jpeg already exists, rename it to a random name
if [ -f "$SELECTED_FILE" ]; then
    # Generate random name with timestamp and random number
    random_name="!previous.jpeg"
    echo "Renaming existing $SELECTED_FILE to $random_name"
    mv "$SELECTED_FILE" "$random_name"
fi

# Copy the selected wallpaper to selected.jpeg
echo "Setting $selected_wallpaper as selected wallpaper"
cp "$selected_wallpaper" "$SELECTED_FILE"

# Kill and restart swww daemon
echo "Restarting swww daemon..."
pkill swww-daemon 2>/dev/null
sleep 1
swww-daemon &
sleep 2

# Set the wallpaper with swww
echo "Setting wallpaper with swww..."
swww img "$WALLPAPER_DIR/$SELECTED_FILE" --transition-type wipe --transition-duration 1

# Run wal with the selected wallpaper
echo "Generating color scheme with pywal..."
wal -i "$WALLPAPER_DIR/$SELECTED_FILE" -t

echo "Wallpaper changed successfully!"

# Optional: Send notification if dunst/mako is available
if command -v notify-send &> /dev/null; then
    notify-send "Wallpaper Changed" "Set to: $selected_wallpaper" --icon="$WALLPAPER_DIR/$SELECTED_FILE"
fi
