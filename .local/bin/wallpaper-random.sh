#!/usr/bin/env bash

# Caminho das imagens
WALLDIR="$HOME/Imagens/Wallpapers"

# Nome do monitor (ajuste conforme o seu)
MONITOR="HDMI-A-1"

# Escolhe uma imagem aleatória (só PNG)
# IMG=$(find "$WALLDIR" -type f -iname "*.png" | shuf -n 1)
IMG=$(find "$WALLDIR" -type f \( -iname "*.png" -o -iname "*.jpg" \) | shuf -n 1)

# Muda o wallpaper via hyprpaper
hyprctl hyprpaper wallpaper "$MONITOR,$IMG"
