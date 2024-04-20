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
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
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
