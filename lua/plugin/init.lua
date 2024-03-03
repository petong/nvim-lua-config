return {
    "folke/which-key.nvim",
    "tpope/vim-fugitive",
    "NLKNguyen/papercolor-theme",
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {"nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
          "nvim-tree/nvim-web-devicons",
        },
        config = function()
          require("nvim-tree").setup {}
        end,
    },
    {
	"L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp"
    },
    "williamboman/mason.nvim"

}
