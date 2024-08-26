return {
  {
    'tpope/vim-sleuth',
    { 'numToStr/Comment.nvim', opts = {} },
    {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      opts = {
        theme = 'catppuccin',
        sections = {
          lualine_c = { { 'filename', path = 1 } },
        },
      },
    },
    -- Highlight todo, notes, etc in comments
    { 'folke/todo-comments.nvim', event = 'VeryLazy', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
    -- Useful plugin to show you pending keybinds.
    {
      'folke/which-key.nvim',
      event = 'VimEnter', -- Sets the loading event to 'VimEnter'
      config = function() -- This is the function that runs, AFTER loading
        require('which-key').setup()

        -- Document existing key chains
        require('which-key').add {
          { '<leader>c', group = '[C]ode' },
          { '<leader>c_', hidden = true },
          { '<leader>d', group = '[D]ocument' },
          { '<leader>d_', hidden = true },
          { '<leader>g', group = '[G]it' },
          { '<leader>g_', hidden = true },
          { '<leader>r', group = '[R]ename' },
          { '<leader>r_', hidden = true },
          { '<leader>s', group = '[S]earch' },
          { '<leader>s_', hidden = true },
          { '<leader>w', group = '[W]orkspace' },
          { '<leader>w_', hidden = true },
        }
      end,
    },

    { -- Collection of various small independent plugins/modules
      'echasnovski/mini.nvim',
      config = function()
        -- Better Around/Inside textobjects
        --
        -- Examples:
        --  - va)  - [V]isually select [A]round [)]paren
        --  - yinq - [Y]ank [I]nside [N]ext [']quote
        --  - ci'  - [C]hange [I]nside [']quote
        require('mini.ai').setup { n_lines = 500 }

        -- Add/delete/replace surroundings (brackets, quotes, etc.)
        --
        -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
        -- - sd'   - [S]urround [D]elete [']quotes
        -- - sr)'  - [S]urround [R]eplace [)] [']
        -- require('mini.surround').setup()
      end,
    },

    {
      dir = '~/Projects/yab.nvim',
      init = function()
        require('yab').setup()
      end,
    },
  },
}
