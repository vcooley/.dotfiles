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
    vim.keymap.set('n', '<leader>gk', gitsigns.preview_hunk, { desc = '[G]it preview change' })
    vim.keymap.set('n', '<leader>gp', gitsigns.prev_hunk, { desc = '[G]it [P]revious change' })
    vim.keymap.set('n', '<leader>gn', gitsigns.next_hunk, { desc = '[G]it [N]ext change' })
    vim.keymap.set('n', '<leader>gb', gitsigns.blame_line, { desc = '[G]it [B]lame line' })
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
