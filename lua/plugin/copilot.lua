return {
  {
    "github/copilot.vim",
    config = function ()
      require("copilot_cmp").setup()
    end,

    require("copilot").setup({
      suggestion = { enabled = false },
      panel = { enabled = false },
    })
  }
}
