-- dap.lua

return {
  {
    'mfussenegger/nvim-dap',
    lazy = true,
    config = function()
      local dap = require('dap')

      -- Python adapter configuration
      dap.adapters.python = {
        type = 'executable',
        command = '/Users/jph/.zinit/plugins/pyenv---pyenv/shims/python3',
        args = { '-m', 'debugpy.adapter' },
      }

      -- Python debugger configuration
      dap.configurations.python = {
        {
          type = 'python',
          request = 'launch',
          name = 'Launch file',
          program = '${file}',
          pythonPath = function()
            return '/Users/jph/.zinit/plugins/pyenv---pyenv/shims/python3'
          end,
        },
      }

      -- Keymaps
      vim.keymap.set('n', '<leader>rr', ':DapToggleRepl<CR>')
    end,
  },
}
