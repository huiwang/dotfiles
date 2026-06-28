# AGENTS.md — Dotfiles

## Who I Am

My name is **Hui**. This is my personal dotfiles repository for macOS.

## Preferences

- Be **concise** in answers
- Prefer **minimal, focused** changes — don't over-engineer
- This config philosophy is **minimalist**: optimized for reading/reviewing LLM-generated code, not writing it

## Repository Structure

```
dotfiles/
├── install.sh          # Symlinks all configs into ~/.config/
├── nvim/               # Neovim configuration (lazy.nvim)
│   ├── init.lua
│   ├── lua/
│   │   ├── options.lua
│   │   ├── keymaps.lua
│   │   └── plugins/    # Per-plugin configs (conform, gitsigns, neogit, neotree, telescope)
│   └── lazy-lock.json
├── tmux/               # Tmux configuration (currently empty)
└── agent/              # AI agent memory & config
    ├── AGENTS.md       # Global agent memory (symlinked to ~/.config/agent/ and ~/.pi/agent/)
    └── RTK.md          # RTK (Rust Token Killer) usage reference
```

## Install

```bash
./install.sh
```

This symlinks:
- `nvim/`  → `~/.config/nvim`
- `tmux/`  → `~/.config/tmux`
- `agent/` → `~/.config/agent`

## Neovim

- Plugin manager: **lazy.nvim**
- Focus: fast file navigation, code browsing, minimal distractions
- Key plugins: `telescope`, `neo-tree`, `neogit`, `gitsigns`, `conform`

## Tmux

- Config directory exists but is currently empty — a blank slate

## Agent Config (`~/.config/agent`)

- `AGENTS.md` — global agent memory loaded by AI tools (also symlinked to `~/.pi/agent/AGENTS.md`)
- `RTK.md` — reference for RTK, a token-optimizing CLI proxy (60–90% token savings)
