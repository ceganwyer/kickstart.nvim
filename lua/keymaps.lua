-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
--
-- local helper function to make mappings easier
local map = function(keys, func, desc, mode)
  mode = mode or 'n'
  vim.keymap.set(mode, keys, func, { desc = desc })
end

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
map('<Esc>', '<cmd>nohlsearch<CR>', 'Clear highlights')

-- Diagnostic keymaps
map('<leader>q', vim.diagnostic.setloclist, 'Open diagnostic [Q]uickfix list')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map('<Esc><Esc>', '<C-\\><C-n>', 'Exit terminal mode', 't')

-- Buffer management
map('<leader>bd', '<cmd>bd<cr>', '[B]uffer [D]elete')
map('<leader>bn', '<cmd>bn<cr>', '[B]uffer [N]ext')
map('<leader>bp', '<cmd>bp<cr>', '[B]uffer [P]revious')
map('<leader>bw', '<cmd>w<cr>', '[B]uffer [W]rite')

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
map('<C-h>', '<C-w><C-h>', 'Move focus to the left window')
map('<C-l>', '<C-w><C-l>', 'Move focus to the right window')
map('<C-j>', '<C-w><C-j>', 'Move focus to the lower window')
map('<C-k>', '<C-w><C-k>', 'Move focus to the upper window')

-- Various Lsp keymaps
map('<leader>li', '<cmd>LspInfo<cr>', '[L]SP [I]nfo')
