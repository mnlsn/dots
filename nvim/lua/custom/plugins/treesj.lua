return {
  'Wansmer/treesj',
  keys = { '<space>tt', '<space>tj', '<space>ts' },
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    local treesj = require 'treesj'
    treesj.setup {
      max_join_length = 180,
    }
    vim.keymap.set('n', 'tt', treesj.toggle, { desc = 'Code: Toggle Blocks (Join/Split)' })
    vim.keymap.set('n', '<leader>tt', treesj.toggle, { desc = 'Code: Toggle Blocks (Join/Split)' })
    vim.keymap.set('n', 'tj', treesj.join, { desc = 'Code: Join' })
    vim.keymap.set('n', '<leader>tj', treesj.join, { desc = 'Code: Join' })
    vim.keymap.set('n', 'ts', treesj.split, { desc = 'Code: Split' })
    vim.keymap.set('n', '<leader>ts', treesj.split, { desc = 'Code: Split' })
  end,
}
