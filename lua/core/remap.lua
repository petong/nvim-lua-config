vim.g.mapleader = "\\"

-- treesitter
vim.keymap.set("n", "<C-n>", "<cmd> NvimTreeToggle <CR>")


vim.keymap.set("n", "<leader><space>", ":noh<cr>")
-- nnoremap <leader><space> :noh<cr>
--

vim.keymap.set("n", "<leader>|", ":set cursorcolumn!<cr>")

vim.keymap.set("n", "Y", "Y")

-- trouble
vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)
