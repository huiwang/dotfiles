-- Load options from the lua/options.lua file
require("options")

-- Load keymaps from the lua/keymaps.lua file
require("keymaps")

-- Track current file for external tools (AI agents, etc.)
require("current-file")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load the plugin specifications from your plugins folder
require("lazy").setup("plugins")
