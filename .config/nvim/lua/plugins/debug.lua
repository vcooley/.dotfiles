-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
  'mfussenegger/nvim-dap',
  dependencies = {
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',

    -- Required dependency for nvim-dap-ui
    'nvim-neotest/nvim-nio',

    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Add your own debuggers here
    'leoluz/nvim-dap-go',
    'mxsdev/nvim-dap-vscode-js',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_setup = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        'js-debug-adapter',
      },
    }

    -- Basic debugging keymaps, feel free to change to your liking!
    vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
    vim.keymap.set('n', '<F1>', dap.step_into, { desc = 'Debug: Step Into' })
    vim.keymap.set('n', '<F2>', dap.step_over, { desc = 'Debug: Step Over' })
    vim.keymap.set('n', '<F3>', dap.step_out, { desc = 'Debug: Step Out' })
    vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>B', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, { desc = 'Debug: Set Breakpoint' })

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup {
      -- Set icons to characters that are more likely to work in every terminal.
      --    Feel free to remove or use ones that you like more! :)
      --    Don't feel like these are good choices.
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
    }

    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- Install golang specific config
    require('dap-go').setup()

    -- setup js adapters
    dap.adapters['pwa-node'] = {
      type = 'server',
      host = 'localhost',
      port = '9222',
      executable = {
        command = 'node',
        args = { vim.fn.stdpath 'data' .. '/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js', '9222' },
      },
    }
    dap.adapters['pwa-chrome'] = {
      type = 'server',
      host = 'localhost',
      port = '${port}',
      executable = {
        command = 'node',
        args = { vim.fn.stdpath 'data' .. '/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js', '${port}' },
      },
    }

    for _, language in ipairs { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' } do
      require('dap').configurations[language] = {
        {
          type = 'pwa-chrome',
          name = 'Debug Chrome Dashboard',
          request = 'attach',
          -- cwd = vim.fn.getcwd(),
          sourceMaps = true,
          webRoot = '${workspaceFolder}/assets/dashboard/src/',
          port = 9222,
        },
        {
          type = 'pwa-chrome',
          name = 'Launch Chrome Dashboard',
          request = 'launch',
          -- cwd = vim.fn.getcwd(),
          sourceMaps = true,
          webRoot = '${workspaceFolder}/assets/dashboard/src/',
          -- launch at this url
          url = 'http://localhost:8000/',
          -- if page opens to about:blank, that may be a symptom of a different chrome instance listening on this port
          port = 9222,
          runtimeArgs = {
            -- should match the port this debug process was launched with
            '--remote-debugging-port=9222',
            -- a profile so that extensions can persist between sessions
            '--profile-directory=debug-profile',
            -- used for window manager query/focus
            '--window-name=DEBUG CHROME',
          },
        },
        {
          type = 'pwa-node',
          request = 'launch',
          name = 'Launch file',
          cwd = '${workspaceFolder}',
          args = { '${file}' },
          sourceMaps = true,
          protocol = 'inspector',
        },
        -- untested
        {
          type = 'pwa-node',
          request = 'attach',
          name = 'Launch file',
          cwd = '${workspaceFolder}',
          args = { '${file}' },
          sourceMaps = true,
          processId = require('dap.utils').pick_process,
          protocol = 'inspector',
        },
        {
          type = 'pwa-chrome',
          name = 'Debug Chrome',
          request = 'attach',
          -- cwd = vim.fn.getcwd(),
          sourceMaps = true,
          webRoot = '${workspaceFolder}',
          port = 9222,
        },
        {
          type = 'pwa-chrome',
          name = 'Launch Chrome',
          request = 'launch',
          -- cwd = vim.fn.getcwd(),
          sourceMaps = true,
          webRoot = '${workspaceFolder}',
          port = 9222,
        },
        -- {
        --   type = 'chrome',
        --   request = 'launch',
        --   name = 'Launch Dashboard Chrome',
        --   url = 'http://localhost:8000',
        --   program = '/Applications/Google Chrome.app/',
        --   cwd = vim.fn.getcwd(),
        --   webRoot = '${workspaceFolder}/assets/dashboard/src/',
        --   runtimeArgs = '--profile-directory=debug-profile --window-name=DEBUG CHROME',
        --   port = jsAdapterPort,
        --   protocol = 'inspector',
        --   -- {
        --   --       "type": "chrome",
        --   --       "runtimeArgs": ["--profile-directory=debug-profile", "--window-name=DEBUG CHROME"],
        --   --     },
        -- },
      }
    end
  end,
}
