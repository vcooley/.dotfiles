-- Here is a more advanced example where we pass configuration
-- options to `gitfunction()signs.nvim`. This is equivalent to the following Lua:
--    require('gitsigns').setup({ ... })
--
-- See `:help gitsigns` to understand what the configuration keys do
return { -- Adds git related signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  config = function(_, opts)
    local gitsigns = require 'gitsigns'
    gitsigns.setup(opts)
    vim.keymap.set('n', '<leader>gp', gitsigns.preview_hunk, { desc = '[G]it [P]review change' })
    vim.keymap.set('n', '<leader>gk', gitsigns.prev_hunk, { desc = '[G]it previous change' })
    vim.keymap.set('n', '<leader>gj', gitsigns.next_hunk, { desc = '[G]it next change' })
  end,
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
  },
}
