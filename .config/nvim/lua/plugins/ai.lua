return {
  {
    'supermaven-inc/supermaven-nvim',
    enabled = false,
    opts = {
      ignore_filetypes = {
        bin = true,
        go = true,
        oil = true,
        text = true,
        zig = true,
      },
    },
  },
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    opts = {
      suggestion = {
        auto_trigger = true,
        hide_during_completion = false,
      },
    },
    init = function(opts)
      require('copilot').setup(opts)
    end,
  },
}
