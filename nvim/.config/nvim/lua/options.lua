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

-- Automatically reload files changed outside of Neovim
vim.opt.autoread = true

-- Check for file changes periodically without requiring focus
local autoread_timer = vim.loop.new_timer()
autoread_timer:start(1000, 1000, vim.schedule_wrap(function()
  vim.cmd("checktime")
end))

