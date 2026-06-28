return {
  {
    '3rd/image.nvim',
    opts = {},
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
      '3rd/image.nvim',
    },
    cmd = 'Neotree',
    keys = {
      { '<leader>e', ':Neotree toggle<CR>', desc = 'Toggle Neo-tree File Explorer' },
    },
    config = function()
      require('neo-tree').setup {
        window = {
          position = 'left',
          width = 30,
          mappings = {
            ['<cr>'] = function(state)
              local node = state.tree:get_node()
              local path = node:get_id()
              if path:match('%.png$') or path:match('%.jpg$') or path:match('%.jpeg$') or path:match('%.gif$') or path:match('%.webp$') then
                local buf = vim.fn.bufnr(path)
                if buf == -1 then
                  buf = vim.api.nvim_create_buf(true, true)
                  vim.api.nvim_buf_set_name(buf, path)
                  vim.bo[buf].buftype = 'nofile'
                  vim.bo[buf].filetype = 'image'
                end
                vim.api.nvim_set_current_buf(buf)
                local img = require('image').from_file(path, { buffer = buf, with_virtual_padding = true })
                img:render()
                vim.api.nvim_create_autocmd({ 'BufLeave', 'BufHidden', 'BufWipeout' }, {
                  buffer = buf,
                  once = true,
                  callback = function()
                    img:clear()
                  end,
                })
                vim.api.nvim_create_autocmd('BufEnter', {
                  buffer = buf,
                  callback = function()
                    img:clear()
                    img = require('image').from_file(path, { buffer = buf, with_virtual_padding = true })
                    img:render()
                  end,
                })
              else
                require('neo-tree.sources.filesystem.commands').open(state)
              end
            end,
          },
        },
        filesystem = {
          follow_current_file = {
            enabled = true,
            leave_dirs_open = true,
          },
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
          },
        },
      }
    end,
  },
}
