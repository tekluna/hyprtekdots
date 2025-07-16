#!/bin/bash

cd ~/hyprtekdots/wallpapers

for file in *; do
    if [[ "$file" != *.png ]]; then
        ffmpeg -i "$file" "${file%.*}.png" -y
    fi
done
