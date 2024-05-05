return { -- Linting
  -- 'nvimtools/none-ls.nvim',
  -- config = function()
  --   -- putting this here as it's the only non null-ls linting setup. Requires the eslint server
  --   -- installed with `npm i -g vscode-langservers-extracted`
  --   local lsp = require 'lspconfig'
  --   vim.print(vim.tbl_values(lsp.util.available_servers()))
  --
  --   local null_ls = require 'null-ls'
  --   null_ls.setup {
  --     sources = {
  --       null_ls.builtins.formatting.stylua,
  --       null_ls.builtins.completion.spell,
  --       null_ls.builtins.formatting.prettierd,
  --     },
  --   }
  -- end,
}
