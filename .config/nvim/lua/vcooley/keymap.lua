-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- clear search highlight on escape
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Override some jumps to center on the screen after jumping
vim.keymap.set('n', '<C-o>', '<C-o>zz')
vim.keymap.set('n', '<C-i>', '<C-i>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

-- Escape on kj in insert mode (helpful when using the integrated laptop keyboard and caps lock is used for ctrl)
vim.keymap.set({ 'i', 'c' }, 'kj', '<Esc>', { silent = true })
-- permutations of the above when I have caps word on or press shift accidentally
vim.keymap.set({ 'i', 'c' }, 'KJ', '<Esc>', { silent = true })
vim.keymap.set({ 'i', 'c' }, 'kJ', '<Esc>', { silent = true })
vim.keymap.set({ 'i', 'c' }, 'Kj', '<Esc>', { silent = true })

-- Navigate wrapped lines as if they were file lines
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', 'j', 'gj')

-- move line/seletion commands
vim.keymap.set('n', '<M-j>', 'V::move .+=<CR>', { desc = 'Move current line down' })
vim.keymap.set('n', '<M-k>', 'V::move .--=<CR>', { desc = 'Move current line up' })
vim.keymap.set('v', '<M-j>', "::move '>+=<CR>gv", { desc = 'Move selected lines down' })
vim.keymap.set('v', '<M-k>', "::move '<--=<CR>gv", { desc = 'Move selected lines up' })

vim.keymap.set('x', '<leader>p', '"_p', { desc = 'Put and keep original text in unnamed register' })
vim.keymap.set({ 'n', 'x' }, '<leader>d', '"_d', { desc = 'Delete text to the black hole register' })

vim.keymap.set('n', '<leader>ww', ':noautocmd w<CR>', { desc = 'Save without running automcommands (e.g formatting)' })
