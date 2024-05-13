return {
    {"nvim-treesitter/nvim-treesitter",
      lazy = false,
      dependencies = {"nvim-treesitter/nvim-treesitter-textobjects"},
      build = ":TSUpdate",
  }
}
