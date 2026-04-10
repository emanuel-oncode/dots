#!/bin/bash

WALL_DIR="$HOME/.config/Wallpapers"
STATE_FILE="$HOME/.cache/wallpaper_index"

mkdir -p "$(dirname "$STATE_FILE")"

mapfile -t WALLPAPERS < <(find "$WALL_DIR" -type f \( \
  -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) | sort)

total=${#WALLPAPERS[@]}

if [ "$total" -eq 0 ]; then
  echo "No se encontraron fondos en $WALL_DIR"
  exit 1
fi

index=0
if [ -f "$STATE_FILE" ]; then
  index=$(cat "$STATE_FILE")
fi

index=$(( (index + 1) % total ))
echo "$index" > "$STATE_FILE"

feh --bg-fill "${WALLPAPERS[$index]}" && wal -i "${WALLPAPERS[$index]}" -n --saturate 1.2
#killall conky
#conky &
