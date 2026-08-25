return {
  -- 1. Main Telescope Plugin
  {
    'nvim-telescope/telescope.nvim',
    -- 2. Required Dependency
    dependencies = { 'nvim-lua/plenary.nvim' },

    -- 3. Configuration and Keymaps
    config = function()
      local telescope = require('telescope')

      telescope.setup({
        -- You can add global configurations here
        defaults = {
          -- Example: use the smart path display
          path_display = { 'smart' },
        },
        pickers = {
          find_files = {
            hidden = true,
          },
          git_status = {
            layout_strategy = 'vertical',
            layout_config = { 
              preview_height = 0.65,
              width = 0.95,
              height = 0.95,
              mirror = true,
            },
          },
          git_commits = {
            layout_strategy = 'vertical',
            layout_config = { 
              preview_height = 0.65,
              width = 0.95,
              height = 0.95,
              mirror = true,
            },
          },
          git_bcommits = {
            layout_strategy = 'vertical',
            layout_config = { 
              preview_height = 0.65,
              width = 0.95,
              height = 0.95,
              mirror = true,
            },
          },
        },
      })

      -- Keymaps (Recommended: using <leader> as Spacebar)
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', function()
        builtin.find_files({
          find_command = { 'fd', '--type', 'f', '--follow' },
        })
      end, { desc = 'Find files (recursively, including hidden and gitignored)' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live Grep (search contents)' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find Buffers (open files)' })
      vim.keymap.set('n', '<leader>fs', builtin.git_status, { desc = 'Find changed files' })
    end
  },

  -- 4. Optional: For better performance on large projects
  -- { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
}
