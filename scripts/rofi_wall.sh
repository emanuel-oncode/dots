#!/bin/bash

WALL_DIR="$HOME/.config/Wallpapers"

mapfile -t WALLPAPERS < <(find "$WALL_DIR" -type f \( \
  -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.webp" \) | sort)

if [ ${#WALLPAPERS[@]} -eq 0 ]; then
  notify-send "Wallpapers" "No hay fondos"
  exit 1
fi

# Formato: nombre\0icono\x1fRUTA
ROFI_LIST=""
for img in "${WALLPAPERS[@]}"; do
  name=$(basename "$img")
  ROFI_LIST+="$name\0icon\x1f$img\n"
done

CHOICE=$(echo -e "$ROFI_LIST" | rofi \
  -dmenu -i -show-icons \
  -p "  " \
  -theme ~/.config/rofi/wall_menu.rasi)

[ -z "$CHOICE" ] && exit 0

# Encontrar ruta real
for img in "${WALLPAPERS[@]}"; do
  if [[ "$(basename "$img")" == "$CHOICE" ]]; then
    SELECTED="$img"
    break
  fi
done

feh --bg-fill "$SELECTED" && wal -i "$SELECTED" -n --saturate 1.2
