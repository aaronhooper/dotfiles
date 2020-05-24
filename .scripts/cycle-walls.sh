#!/usr/bin/env zsh
# Sets the least recently accessed wallpaper in directory

set -xv

DIR="$HOME/Pictures/walls"
NEXT_BG=$(ls -ur $DIR | head -n1)
PYWAL="$HOME/.local/bin/wal"

eval $PYWAL -i "$DIR/$NEXT_BG"
