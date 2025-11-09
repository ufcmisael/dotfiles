#!/bin/bash

# ---------------------------
# Verifica se argumento foi passado
# ---------------------------
if [ -z "$1" ]; then
    echo "Uso: $0 <caminho_do_diretorio_ou_arquivo>"
    exit 1
fi

TARGET="$1"

# ---------------------------
# Verifica se o arquivo/diretório existe
# ---------------------------
if [ ! -e "$TARGET" ]; then
    echo "Erro: '$TARGET' não existe."
    exit 1
fi

# ---------------------------
# Alias temporário para o repo bare
# ---------------------------
DOTFILES_DIR="$HOME/.dotfiles"
GIT_CMD="git --git-dir=$DOTFILES_DIR --work-tree=$HOME"

# ---------------------------
# Adiciona o arquivo/diretório ao Git
# ---------------------------
$GIT_CMD add "$TARGET"
$GIT_CMD commit -m "Adiciona $TARGET aos dotfiles" 2>/dev/null || echo "Nada novo para commitar"
$GIT_CMD push

echo "$TARGET adicionado ao dotfiles!"

# ---------------------------
# Adiciona ao WATCH_LIST do script dotfiles-check
# ---------------------------
CHECK_SCRIPT="$HOME/.dotfiles-check.sh"

# Cria WATCH_LIST se não existir
if ! grep -q "WATCH_LIST=" "$CHECK_SCRIPT"; then
    echo -e "\nWATCH_LIST=(\n    \"$TARGET\"\n)" >> "$CHECK_SCRIPT"
    echo "$TARGET adicionado ao WATCH_LIST."
else
    # Checa se já existe
    if ! grep -q "$TARGET" "$CHECK_SCRIPT"; then
        # Adiciona antes do fechamento do array
        sed -i "/WATCH_LIST=(/a \    \"$TARGET\"" "$CHECK_SCRIPT"
        echo "$TARGET adicionado ao WATCH_LIST."
    else
        echo "$TARGET já está no WATCH_LIST."
    fi
fi
