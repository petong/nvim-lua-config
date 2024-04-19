return {
    require("mason").setup({
        ensure_installed = { "lua_ls", "rust_analyzer", "lua-language-server", "python-lsp-server" },
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    })
}
