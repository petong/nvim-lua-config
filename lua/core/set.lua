vim.opt.guicursor = ""

vim.opt.hidden = true


vim.opt.termguicolors = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.swapfile = false
--vim.opt.backup = false
--vim.opt.undodir = os.getenv("HOME") .. "/.local/undodir"
vim.opt.undofile = true



vim.opt.number = true
vim.opt.mouse = ""

-- Indentation
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.shiftwidth=2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true


local data_dir = vim.fn.expand('~/.local/share/nvim')

-- Create data directory if it doesn't exist
vim.fn.mkdir(data_dir, 'p')

-- Set backup directory
local backup_dir = data_dir .. '/backup//'
vim.fn.mkdir(backup_dir, 'p')
vim.opt.backupdir = backup_dir

-- Set undo directory
local undo_dir = data_dir .. '/undo//'
vim.fn.mkdir(undo_dir, 'p')
vim.opt.undodir = undo_dir


-- obsidian settings
vim.opt_local.conceallevel = 2

vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

-- hardmode
local hardmode = true
if hardmode then
    -- Show an error message if a disabled key is pressed
    local msg = [[<cmd>echohl Error | echo "KEY DISABLED" | echohl None<CR>]]

    -- Disable arrow keys in insert mode with a styled message
    vim.api.nvim_set_keymap('i', '<Up>', '<C-o>' .. msg, { noremap = true, silent = false })
    vim.api.nvim_set_keymap('i', '<Down>', '<C-o>' .. msg, { noremap = true, silent = false })
    vim.api.nvim_set_keymap('i', '<Left>', '<C-o>' .. msg, { noremap = true, silent = false })
    vim.api.nvim_set_keymap('i', '<Right>', '<C-o>' .. msg, { noremap = true, silent = false })
    -- vim.api.nvim_set_keymap('i', '<Del>', '<C-o>' .. msg, { noremap = true, silent = false })
    -- vim.api.nvim_set_keymap('i', '<BS>', '<C-o>' .. msg, { noremap = true, silent = false })

    -- Disable arrow keys in normal mode with a styled message
    vim.api.nvim_set_keymap('n', '<Up>', msg, { noremap = true, silent = false })
    vim.api.nvim_set_keymap('n', '<Down>', msg, { noremap = true, silent = false })
    vim.api.nvim_set_keymap('n', '<Left>', msg, { noremap = true, silent = false })
    vim.api.nvim_set_keymap('n', '<Right>', msg, { noremap = true, silent = false })
    -- vim.api.nvim_set_keymap('n', '<BS>', msg, { noremap = true, silent = false })
end


