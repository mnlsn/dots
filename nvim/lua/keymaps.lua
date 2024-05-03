-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>de', vim.diagnostic.open_float, { desc = 'Show [D]iagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, { desc = 'Open [D]iagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')

vim.keymap.set('i', '<C-s>', '<cmd>w<cr><esc>', { desc = 'Write file' })
vim.keymap.set('n', '<C-s>', '<cmd>w<cr><esc>', { desc = 'Write file' })
vim.keymap.set('s', '<C-s>', '<cmd>w<cr><esc>', { desc = 'Write file' })
vim.keymap.set('x', '<C-s>', '<cmd>w<cr><esc>', { desc = 'Write file' })

local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go { severity = severity }
  end
end

vim.keymap.set('n', '[b', '<cmd>bprevious<cr>', { desc = 'Previous [B]uffer' })
vim.keymap.set('n', ']b', '<cmd>bnext<cr>', { desc = 'Next [B]uffer' })
vim.keymap.set('n', '<leader>bb', '<cmd>e #<cr>', { desc = 'Switch to other buffer' })
vim.keymap.set('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'Lazy' })
vim.keymap.set('n', '[q', vim.cmd.cprev, { desc = 'Previous Quickfix' })
vim.keymap.set('n', ']q', vim.cmd.cprev, { desc = 'Next Quickfix' })
vim.keymap.set('n', '[d', diagnostic_goto(true), { desc = 'Previous Diagnostic' })
vim.keymap.set('n', ']q', diagnostic_goto(false), { desc = 'Next Diagnostic' })
vim.keymap.set('n', ']e', diagnostic_goto(true, 'ERROR'), { desc = 'Next Error' })
vim.keymap.set('n', '[e', diagnostic_goto(false, 'ERROR'), { desc = 'Prev Error' })
vim.keymap.set('n', ']w', diagnostic_goto(true, 'WARN'), { desc = 'Next Warning' })
vim.keymap.set('n', '[w', diagnostic_goto(false, 'WARN'), { desc = 'Prev Warning' })

-- TODO: add toggle method and adjust to use without LazyVim
-- map("n", "<leader>uf", function() LazyVim.format.toggle() end, { desc = "Toggle Auto Format (Global)" })
-- map("n", "<leader>uF", function() LazyVim.format.toggle(true) end, { desc = "Toggle Auto Format (Buffer)" })
-- map("n", "<leader>us", function() LazyVim.toggle("spell") end, { desc = "Toggle Spelling" })
-- map("n", "<leader>uw", function() LazyVim.toggle("wrap") end, { desc = "Toggle Word Wrap" })
-- map("n", "<leader>uL", function() LazyVim.toggle("relativenumber") end, { desc = "Toggle Relative Line Numbers" })
-- map("n", "<leader>ul", function() LazyVim.toggle.number() end, { desc = "Toggle Line Numbers" })
-- map("n", "<leader>ud", function() LazyVim.toggle.diagnostics() end, { desc = "Toggle Diagnostics" })
--

vim.keymap.set('n', '<leader>-', '<C-W>s', { desc = 'Split Window Below', remap = true })
vim.keymap.set('n', '<leader>\\', '<C-W>v', { desc = 'Split Window Right', remap = true })
vim.keymap.set('n', '<leader>wh', '<C-W>s', { desc = 'Split Window Below', remap = true })
vim.keymap.set('n', '<leader>wv', '<C-W>v', { desc = 'Split Window Right', remap = true })
vim.keymap.set('n', '<leader>wd', '<C-W>c', { desc = 'Delete Window', remap = true })

vim.keymap.set('n', '<leader><tab>l', '<cmd>tablast<cr>', { desc = 'Last Tab' })
vim.keymap.set('n', '<leader><tab>f', '<cmd>tabfirst<cr>', { desc = 'First Tab' })
vim.keymap.set('n', '<leader><tab><tab>', '<cmd>tabnew<cr>', { desc = 'New Tab' })
vim.keymap.set('n', '<leader><tab>]', '<cmd>tabnext<cr>', { desc = 'Next Tab' })
vim.keymap.set('n', '<leader><tab>d', '<cmd>tabclose<cr>', { desc = 'Close Tab' })
vim.keymap.set('n', '<leader><tab>[', '<cmd>tabprevious<cr>', { desc = 'Previous Tab' })
vim.keymap.set('n', '<leader>o', '<cmd>AerialToggle!<CR>', { desc = 'Symbols Outline' })
vim.keymap.set('n', '<leader>z', '<cmd>ZenMode<cr>', { desc = 'Toggle Zen Mode' })
vim.keymap.set('n', '<leader>gh', '<cmd>GitBlameToggle<cr>', { desc = 'Toggle [G]it Blame Inlay [H]ints' })

-- add undo breakpoints
vim.keymap.set('i', ',', ',<c-g>u')
vim.keymap.set('i', '.', '.<c-g>u')
vim.keymap.set('i', ':', ':<c-g>u')
vim.keymap.set('i', '<cr>', '<cr><c-g>u')

-- vim: ts=2 sts=2 sw=2 et
