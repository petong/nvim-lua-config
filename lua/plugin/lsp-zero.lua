return {

    'VonHeikemen/lsp-zero.nvim',
    config = function()
        require("lsp-zero").setup({
            branch = 'v3.x',
            lazy = true,
            config = false,
        })
    end
}

