-- Tracks the current file being edited and writes it to a state file
-- so external tools (e.g. AI coding agents) can know what you're looking at.

local state_dir = vim.fn.stdpath("cache")
local state_file = state_dir .. "/current_file"

local function write_current_file()
  local path = vim.api.nvim_buf_get_name(0)
  if path == "" then
    return
  end
  vim.fn.mkdir(state_dir, "p")
  local f = io.open(state_file, "w")
  if f then
    f:write(path)
    f:close()
  end
end

vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained" }, {
  callback = write_current_file,
})
