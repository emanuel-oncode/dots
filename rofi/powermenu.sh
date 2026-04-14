#!/bin/bash

options=" Apagar\n Reiniciar\n Cerrar sesión"

chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power Menu")

case "$chosen" in
    "  Apagar")
        systemctl poweroff
        ;;
    "  Reiniciar")
        systemctl reboot
        ;;
    "  Cerrar sesión")
        i3-msg exit
        ;;
esac
