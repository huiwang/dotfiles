-- 1. Set the global mapleader variable to the Spacebar.
-- This defines what the <leader> symbol in keymaps refers to.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Show line numbers
vim.opt.number = true

-- Enable line wrapping at word boundaries
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true

-- Auto-reload files changed outside of nvim
vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  command = "if mode() != 'c' | checktime | endif",
})
vim.api.nvim_create_autocmd("FileChangedShellPost", {
  pattern = "*",
  command = "echohl WarningMsg | echo 'File changed on disk. Buffer reloaded.' | echohl None",
})


