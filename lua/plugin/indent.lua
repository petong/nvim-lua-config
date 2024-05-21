return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function (_, opts)
      vim.keymap.set("n", "<leader>i", "<cmd> IBLToggle <CR>")
      require("oil").setup(opts)
    end,
  }
}
