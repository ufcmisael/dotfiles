# dotfiles

Meus dotfiles pessoais, gerenciados com [GNU Stow](https://www.gnu.org/software/stow/).

## Conteúdo

- `nvim` — configuração do Neovim (LazyVim-style, plugins em Lua)
- `hypr` — Hyprland (WM)
- `alacritty` — terminal, com temas em `themes/`
- `wofi` — launcher, com temas em `themes/`
- `waybar` — barra de status, com temas em `themes/`
- `mpv` — player de mídia
- `.local/bin` — scripts (troca de wallpaper)
- `.local/containers/pgadmin` — docker-compose do pgAdmin
- `.zshrc` — configuração do zsh

## Instalação

Clone o repositório na home:

```bash
git clone <url-do-repo> ~/.dotfiles
cd ~/.dotfiles
```

Linke tudo com stow:

```bash
stow -v .
```

Isso cria os symlinks na home apontando pra este diretório, respeitando a estrutura (`.config/nvim`, `.zshrc`, etc).

Para desfazer os links:

```bash
stow -Dv .
```

Para relinkar depois de mudanças na estrutura:

```bash
stow -Rv .
```

## Observações

- Os temas de `alacritty`, `wofi` e `waybar` ficam em `themes/`, e o tema ativo é indicado pelo arquivo `.current_theme` em cada um.
- Arquivos `.bak` dentro de `nvim/lua/plugins/` são configs desativadas, mantidas só de referência.
