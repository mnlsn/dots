return {
  {
    'stevearc/aerial.nvim',
    opts = {
      layout = {
        width = 60,
      },
      filter_kind = {
        'Class',
        'Constant',
        'Constructor',
        'Enum',
        'Event',
        'Function',
        'Interface',
        'Module',
        'Method',
        'Object',
        'Struct',
        -- 'Variable',
      },
      on_attach = function(bufnr)
        -- Jump forwards/backwards with '{' and '}'
        vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
        vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr })
      end,
    },
    -- Optional dependencies
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
  },
}
