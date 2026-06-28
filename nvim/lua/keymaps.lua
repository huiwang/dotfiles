local keymap = vim.keymap.set

keymap("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { noremap = true, silent = true })

-- Copy file paths to clipboard
keymap("n", "<leader>cp", '<cmd>let @+ = expand("%:p")<CR>', { desc = "Copy absolute path" })

-- Copy selected text to clipboard
keymap("v", "<leader>y", '"+y', { desc = "Copy to clipboard" })
keymap("n", "<leader>y", '"+y', { desc = "Copy to clipboard" })

-- Kill current buffer
keymap("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Kill buffer" })

-- Delete all buffers except current
keymap("n", "<leader>bo", "<cmd>%bd|e#|bd#<CR>", { desc = "Kill other buffers" })

-- Format current file
keymap({ "n", "v" }, "<leader>fm", function()
  require("conform").format({ async = true })
end, { desc = "Format file" })

-- Clear search highlights
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
