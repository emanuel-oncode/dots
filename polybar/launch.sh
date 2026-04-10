#!/usr/bin/env bash

# Terminar instancias existentes
killall -q polybar

# Esperar a que se cierren
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Lanzar Polybar (asumiendo que tu barra se llama 'minimal')
# Polybar leerá automáticamente los nuevos colores del archivo en .cache
polybar minimal 2>&1 | tee -a /tmp/polybar.log & disown
