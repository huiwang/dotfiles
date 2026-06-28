return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      markdown = { "prettier" },
    },
    -- Auto-format on save for markdown files
    format_on_save = function(bufnr)
      local ft = vim.bo[bufnr].filetype
      if ft == "markdown" then
        return { timeout_ms = 3000, lsp_fallback = false }
      end
    end,
  },
}
