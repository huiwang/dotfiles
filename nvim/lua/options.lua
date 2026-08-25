-- 1. Set the global mapleader variable to the Spacebar.
-- This defines what the <leader> symbol in keymaps refers to.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Show line numbers and keep change markers visible
vim.opt.number = true
vim.opt.signcolumn = "yes"

-- Agent processes often modify files behind Neovim's back.
vim.opt.autoread = true
vim.opt.updatetime = 300
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  desc = "Reload files changed outside Neovim",
  command = "silent! checktime",
})

-- Keep review context and local recovery history.
vim.opt.scrolloff = 6
vim.opt.undofile = true

-- Enable line wrapping at word boundaries
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true


