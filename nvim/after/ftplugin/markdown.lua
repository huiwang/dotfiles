-- Markdown is prose, not code: rely on soft-wrap instead of hard line breaks
-- so text always fits the window naturally.
vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.breakindent = true
vim.opt_local.textwidth = 0

-- Navigate by visual (display) line instead of logical line.
vim.keymap.set("n", "j", "gj", { buffer = true })
vim.keymap.set("n", "k", "gk", { buffer = true })
