#!/bin/bash

WALL_DIR="$HOME/Imagens/Wallpapers"
CACHE="$HOME/.cache/current_wall.txt"
CONF="$HOME/.config/hypr/hyprpaper.conf"

# Verifica se o hyprpaper está rodando, se não, inicia ele
if ! pgrep -x "hyprpaper" > /dev/null; then
    hyprpaper &
    sleep 1 # Espera o daemon subir
fi

# Cria cache se não existir
if [ ! -f "$CACHE" ]; then
  echo 0 > "$CACHE"
fi

INDEX=$(cat "$CACHE")
# Garante que vai pegar arquivos mesmo com espaços no nome
mapfile -t FILES < <(find "$WALL_DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" \))
COUNT=${#FILES[@]}

# Evita erro de divisão por zero se a pasta estiver vazia
if [ "$COUNT" -eq 0 ]; then
    notify-send "Wallpaper Error" "Nenhuma imagem encontrada em $WALL_DIR"
    exit 1
fi

NEXT=$(( (INDEX + 1) % COUNT ))
NEXT_FILE="${FILES[$NEXT]}"

echo "Mudando para: $NEXT_FILE"

# 1. Preload da nova imagem
hyprctl hyprpaper preload "$NEXT_FILE"

# 2. Aplica o wallpaper (a vírgula antes do caminho aplica a todos os monitores)
hyprctl hyprpaper wallpaper ",$NEXT_FILE"

# 3. Limpa a memória (remove a imagem anterior do preload)
# O comando 'unload unused' remove tudo que não está sendo exibido no momento
# sleep 0.5
hyprctl hyprpaper unload unused

# 4. Persistência (atualiza config para o próximo boot)
echo "
# mensagens hyprland
splash = false
# permitir troca de wallpaper sem matar sessao
ipc = true

wallpaper {
    monitor =
    path = $NEXT_FILE
    fit_mode = cover
}
" > "$CONF"

# 5. Atualiza índice
echo "$NEXT" > "$CACHE"
# # Usa o Hyprpaper ativo para trocar
# hyprctl hyprpaper preload "$NEXT_FILE"
# sleep 0.02
# hyprctl hyprpaper wallpaper ",$NEXT_FILE"
