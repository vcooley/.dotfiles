return { -- Add indentation guides even on blank lines
  'lukas-reineke/indent-blankline.nvim',
  -- Enable `lukas-reineke/indent-blankline.nvim`
  -- See `:help ibl`
  cond = not vim.g.vscode,
  main = 'ibl',
  opts = {},
  enable = false,
}
