#!/bin/bash
set -e

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Map of dotfiles module → symlink target
declare -A LINKS=(
  ["$DOTFILES/nvim"]="$HOME/.config/nvim"
  ["$DOTFILES/tmux"]="$HOME/.config/tmux"
  ["$DOTFILES/agent"]="$HOME/.config/agent"
)

for src in "${!LINKS[@]}"; do
  dest="${LINKS[$src]}"

  # If dest is already the correct symlink, skip
  if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
    echo "  ok  $dest"
    continue
  fi

  # Back up any existing real directory
  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    backup="${dest}.bak.$(date +%s)"
    mv "$dest" "$backup"
    echo "  backed up  $dest → $backup"
  fi

  ln -sf "$src" "$dest"
  echo "  linked  $dest → $src"
done
