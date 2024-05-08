return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup { n_lines = 502 }
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      --
      require('mini.bracketed').setup()
      require('mini.comment').setup()
      require('mini.diff').setup()

      local files = require 'mini.files'
      files.setup()
      local openCurrent = function()
        files.open(vim.api.nvim_buf_get_name(0))
        files.reveal_cwd()
      end
      vim.keymap.set('n', '<leader>e', files.open, { desc = 'Open Files' })
      vim.keymap.set('n', '<leader>i', openCurrent, { desc = 'Open Files [i]n cwd' })

      local indents = require 'mini.indentscope'
      indents.config = {
        draw = {
          animation = function(s, n)
            return 15
          end,
          delay = 60,
        },
      }
      indents.setup()
      require('mini.indentscope').setup()
      require('mini.move').setup()
      require('mini.notify').setup()
      require('mini.sessions').setup { autoread = true }
      require('mini.splitjoin').setup()

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()
      require('mini.tabline').setup()
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
