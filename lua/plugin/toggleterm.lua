return {
  'akinsho/toggleterm.nvim',
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  config = function()
    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new({
      cmd = "lazygit",
      direction = "float",
      float_opts = {
        border = "double",
      },
      close_on_exit = true,
    })

    function _lazygit_toggle()
      lazygit:toggle()
    end

    vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
    -- vim.keymap.set("n", "<leader>tt", ":ToggleTermSendCurrentLine<CR>")

    require("toggleterm").setup{}
  end
}
