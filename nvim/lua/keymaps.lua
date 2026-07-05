local keymap = vim.keymap.set

keymap("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { noremap = true, silent = true })

-- Copy file paths to clipboard
keymap("n", "<leader>cp", '<cmd>let @+ = expand("%:p")<CR>', { desc = "Copy absolute path" })

-- Copy selected text to clipboard
keymap("v", "<leader>y", '"+y', { desc = "Copy to clipboard" })
keymap("n", "<leader>y", '"+y', { desc = "Copy to clipboard" })

-- Buffer navigation
keymap("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Prev buffer" })
keymap("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })

-- Kill current buffer (switch to prev first to avoid neo-tree going fullscreen)
keymap("n", "<leader>bd", function()
  local bufs = vim.fn.getbufinfo({ buflisted = 1 })
  if #bufs > 1 then
    vim.cmd("bp|bd#")
  else
    vim.cmd("bd")
  end
end, { desc = "Kill buffer" })

-- Delete all buffers except current
keymap("n", "<leader>bo", "<cmd>%bd|e#|bd#<CR>", { desc = "Kill other buffers" })


-- Clear search highlights
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
