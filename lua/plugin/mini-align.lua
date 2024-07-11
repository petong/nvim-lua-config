return {
  {
    'echasnovski/mini.nvim', version = false,
    config = function()
      require('mini.align').setup({
        mappings = {
          start = 'Ga',
          start_with_preview = 'GA',
        },

      })
    end
  },
}
