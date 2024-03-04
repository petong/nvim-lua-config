return {
    "folke/which-key.nvim",
    "tpope/vim-fugitive",
    "NLKNguyen/papercolor-theme",
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {
	"L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
    },
    "williamboman/mason.nvim"

}
