#!/usr/bin/env bash

# --- Configurações ---
WALL_DIR="$HOME/Imagens/Wallpapers"

# ---  Verifica se o hyprpaper está rodando ---
if ! pgrep -x "hyprpaper" > /dev/null; then
    echo "Hyprpaper não está rodando. Iniciando..."
    hyprpaper &
    sleep 1 # Dá tempo para o socket iniciar
fi

# O comando find busca jpg, png e jpeg. O shuf pega um aleatório.
IMG=$(find "$WALL_DIR" -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" \) | shuf -n 1)

# Verifica se encontrou alguma imagem
if [ -z "$IMG" ]; then
    notify-send "Erro Wallpaper" "Nenhuma imagem encontrada na pasta!"
    exit 1
fi

hyprctl hyprpaper preload "$IMG"
hyprctl hyprpaper wallpaper ",$IMG"

sleep 1 
hyprctl hyprpaper unload unused
