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

# Link a file and all @referenced files from it to the same destination directory
link_with_refs() {
  local src_rel="$1"   # e.g. agent/AGENTS.md
  local dest="$2"       # e.g. $HOME/.pi/agent/AGENTS.md

  link "$src_rel" "$dest"

  local src_dir
  src_dir="$(dirname "$DOTFILES/$src_rel")"
  local dest_dir
  dest_dir="$(dirname "$dest")"

  # Find all @Filename references in the source file
  grep -oE '@[^[:space:]]+' "$DOTFILES/$src_rel" | sed 's/^@//' | while read -r ref; do
    local ref_rel
    ref_rel="$(dirname "$src_rel")/$ref"
    if [ -e "$DOTFILES/$ref_rel" ]; then
      link "$ref_rel" "$dest_dir/$ref"
    else
      echo "  missing $DOTFILES/$ref_rel (referenced in $src_rel)"
    fi
  done
}

link nvim              "$HOME/.config/nvim"
link tmux              "$HOME/.config/tmux"
link agent             "$HOME/.config/agent"
link_with_refs agent/AGENTS.md   "$HOME/.pi/agent/AGENTS.md"
link_with_refs agent/AGENTS.md   "$HOME/.claude/CLAUDE.md"
