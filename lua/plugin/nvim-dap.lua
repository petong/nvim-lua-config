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
        command = 'python3',
        args = { '-m', 'debugpy.adapter' }
      }

      dap.configurations.python = {
        {
          type = 'python',
          request = 'launch',
          name = "Launch file",
          program = "${file}",
          pythonPath = function()
            return '/Users/jph/.pyenv/shims/python3'
          end,
        },
      }

      -- Keymaps
      vim.keymap.set('n', '<leader>rr', ':DapToggleRepl<CR>')
    end,
  },
}
