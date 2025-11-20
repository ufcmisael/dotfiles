#!/bin/bash

WALL_DIR="$HOME/Imagens/Wallpapers"
CACHE="$HOME/.cache/current_wall.txt"
CONF="$HOME/.config/hypr/hyprpaper.conf"

# Cria cache se não existir
if [ ! -f "$CACHE" ]; then
  echo 0 > "$CACHE"
fi

INDEX=$(cat "$CACHE")
FILES=("$WALL_DIR"/*)
COUNT=${#FILES[@]}
NEXT=$(( (INDEX + 1) % COUNT ))
NEXT_FILE="${FILES[$NEXT]}"

# Usa o Hyprpaper ativo para trocar
hyprctl hyprpaper preload "$NEXT_FILE"
sleep 0.02
hyprctl hyprpaper wallpaper ",$NEXT_FILE"

# Recria o arquivo de config do hyprpaper
echo "preload = $NEXT_FILE" > "$CONF"
echo "wallpaper = ,$NEXT_FILE" >> "$CONF"

# # Recarrega o hyprpaper
# pkill hyprpaper
# hyprpaper -c "$CONF" &

# Atualiza índice
echo "$NEXT" > "$CACHE"
