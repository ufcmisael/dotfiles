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

hyprctl hyprpaper wallpaper ",$IMG,cover"

# 2.1 Atualiza a paleta de cores (pywal)
# Só roda o pywal se algum tema "wallpaper" estiver ativo
NEED_WAL=false
[ "$(cat ~/.config/waybar/.current_theme 2>/dev/null)" = "wallpaper" ] && NEED_WAL=true
[ "$(cat ~/.config/alacritty/.current_theme 2>/dev/null)" = "wallpaper" ] && NEED_WAL=true

if [ "$NEED_WAL" = true ]; then
    wal -i "$NEXT_FILE" -n -s -q
fi

sleep 1 
hyprctl hyprpaper unload unused

# Waybar: só TOCA o style.css pra disparar o reload_style_on_change (sem matar processo)
if [ "$(cat ~/.config/waybar/.current_theme 2>/dev/null)" = "wallpaper" ]; then
    touch ~/.config/waybar/style.css
fi

# Alacritty: só copia se o tema ativo for wallpaper
if [ "$(cat ~/.config/alacritty/.current_theme 2>/dev/null)" = "wallpaper" ]; then
    cp ~/.cache/wal/colors-alacritty.toml ~/.config/alacritty/themes/wallpaper.toml
    cp ~/.config/alacritty/themes/wallpaper.toml ~/.config/alacritty/themes/current.toml
fi
