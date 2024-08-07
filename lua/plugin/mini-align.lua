return {
  {
    'echasnovski/mini.nvim', version = false,
    config = function()
      require('mini.align').setup({
        mappings = {
          start = '',
          start_with_preview = '',
        },

      })
    end
  },
}
