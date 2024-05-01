return {
    require("mason").setup({
      ensure_installed = {
        "lua-language-server",
        "lua_ls",
        "python-lsp-server",
        "rust_analyzer",
        "gopls",
        "hclfmt",
        "jq",
        "json-lsp",
        "jsonlint",
        "lua-language-server",
        "pylint",
        "python-lsp-server",
        "rust-analyzer",
        "terraform-ls",
        "typescript-language-server",
        "vim-language-server",
        "yaml-language-server",
      },
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    })
}
