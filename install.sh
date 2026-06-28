#!/bin/bash
set -e

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link() {
  local src="$DOTFILES/$1"
  local dest="$2"

  # Already the correct symlink — skip
  if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
    echo "  ok      $dest"
    return
  fi

  # Back up any existing real directory or file
  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    local backup="${dest}.bak.$(date +%s)"
    mv "$dest" "$backup"
    echo "  backup  $dest → $backup"
  fi

  mkdir -p "$(dirname "$dest")"
  ln -sf "$src" "$dest"
  echo "  linked  $dest → $src"
}

link nvim   "$HOME/.config/nvim"
link tmux   "$HOME/.config/tmux"
link agent  "$HOME/.config/agent"
