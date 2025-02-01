return {
  'stevearc/oil.nvim',
  cond = not vim.g.vscode,
  opts = {
    view_options = {
      show_hidden = true,
    },
  },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}
