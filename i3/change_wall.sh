#!/bin/bash

DIR="$HOME/.config/Wallpapers"

WALL=$(find "$DIR" -type f | shuf -n 1)

feh --bg-fill "$WALL"

wal -i "$WALL" -n

