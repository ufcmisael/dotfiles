
#!/bin/bash

# ---------------------------
# Checa se o argumento foi passado
# ---------------------------
if [ -z "$1" ]; then
    echo "Uso: $0 'mensagem do commit'"
    exit 1
fi

COMMIT_MSG="$1"

# ---------------------------
# Alias temporário para o repo bare
# ---------------------------
DOTFILES_DIR="$HOME/.dotfiles"
GIT_CMD="git --git-dir=$DOTFILES_DIR --work-tree=$HOME"

# ---------------------------
# Adiciona todas as alterações
# ---------------------------
$GIT_CMD add -A

# ---------------------------
# Cria commit
# ---------------------------
$GIT_CMD commit -m "$COMMIT_MSG"

# ---------------------------
# Envia para o remote
# ---------------------------
$GIT_CMD push
