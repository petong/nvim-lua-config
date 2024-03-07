local lsp_zero = require('lsp-zero')
lsp_zero.extend_lspconfig()

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- Check if the client is the Java LSP server
  if client.name == "jdtls" then
    print("Using Java LSP server")
  end
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = {'tsserver', 'rust_analyzer'},
  handlers = {
    lsp_zero.default_setup,
  },
})
