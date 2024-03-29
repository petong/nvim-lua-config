return {
    require("nvim-tree").setup({
      disable_netrw = false,
      hijack_netrw = true,
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
      },
    })
}
