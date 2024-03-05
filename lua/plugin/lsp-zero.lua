return {

    'VonHeikemen/lsp-zero.nvim',
    config = function()
        require("mason").setup({
            branch = 'v3.x',
            lazy = true,
            config = false,
        })
    end
}

