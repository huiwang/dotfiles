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

-- Auto-create missing parent directories on save
local mkdir_augroup = vim.api.nvim_create_augroup("mkdir_on_save", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  group = mkdir_augroup,
  callback = function(args)
    local path = vim.api.nvim_buf_get_name(args.buf)

    if path == "" or path:match("^%w+://") then
      return
    end

    local dir = vim.fn.fnamemodify(path, ":p:h")
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, "p")
    end
  end,
})


