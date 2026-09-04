-- 1. Set the global mapleader variable to the Spacebar.
-- This defines what the <leader> symbol in keymaps refers to.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Show line numbers and keep change markers visible
vim.opt.number = true
vim.opt.signcolumn = "yes"

-- Agent processes often modify files behind Neovim's back. Poll for
-- changes since we're often unfocused (e.g. in a tmux side panel).
vim.opt.autoread = true
local checktime_timer = vim.uv.new_timer()
checktime_timer:start(0, 1000, vim.schedule_wrap(function()
  vim.cmd("silent! checktime")
  -- Redraw only outside insert mode to avoid cursor glitches while typing
  if vim.fn.mode() ~= "i" then
    vim.cmd("redraw")
  end
end))

-- Keep review context and local recovery history.
vim.opt.scrolloff = 6
vim.opt.undofile = true

-- Enable line wrapping at word boundaries
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true


