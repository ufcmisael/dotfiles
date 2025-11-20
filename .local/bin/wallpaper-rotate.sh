#!/usr/bin/env bash

# Diretório dos wallpapers
WALLDIR="$HOME/Imagens/Wallpapers"
MONITOR="HDMI-A-1"  # use o nome exato do monitor (ex: HDMI-A-1, DP-1, etc)
INTERVAL=300        # segundos entre trocas (aqui: 5 minutos)

while true; do
    # Escolhe uma imagem aleatória
    IMG=$(find "$WALLDIR" -type f | shuf -n 1)

    # Aplica o wallpaper
    hyprctl hyprpaper wallpaper "$MONITOR,$IMG"

    # Aguarda o intervalo antes da próxima troca
    sleep "$INTERVAL"
done
