
#!/bin/bash

# Caminho para o repositório bare de dotfiles
DOTFILES_DIR="$HOME/.dotfiles"

# Alias temporário para acessar o repo
GIT_CMD="git --git-dir=$DOTFILES_DIR --work-tree=$HOME"

# Checa se há mudanças
CHANGES=$($GIT_CMD status --porcelain)

if [[ -n "$CHANGES" ]]; then
    FILES=$(echo "$CHANGES" | awk '{print $2}')
    notify-send "Dotfiles Update" "Alterações nos dotfiles:\n$FILES"
fi
