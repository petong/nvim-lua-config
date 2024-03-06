# Neovim Configs in Lua

The repo is set up with 3 main areas:

```
❯ tree -d
.
└── lua
    ├── config
    ├── core
    └── plugins
```

### core
Files in this directory are used for setting vim configs, key mappings.

### config
Used for plugin configuration



## Plugins
### Lazy.nvim
https://github.com/folke/lazy.nvim

### Telescope
Highly extendable fuzzy finder over lists
https://github.com/nvim-telescope/telescope.nvim

|key|action|
|---|------|
|C-p|fuzzy search git|
|<leader>pws|search for highlighted word in git repo|
|<leader>ps|Grep >|
|<leader>fh|help tags|
|<leader>fg|live grep|
|<leader>fb|buffers|

### Which Key
Displays a popup with possible key bindings of the command you started typing
```
:WhichKey " show all mappings
:WhichKey <leader> " show all <leader> mappings
:WhichKey <leader> v " show all <leader> mappings for VISUAL mode
:WhichKey '' v " show ALL mappings for VISUAL mode
```
https://github.com/folke/which-key.nvim

### nvim-tree
A File Explorer For Neovim Written In Lua
https://github.com/nvim-tree/nvim-tree.lua

### lualine
A blazing fast and easy to configure Neovim statusline written in iLua.
https://github.com/nvim-lualine/lualine.nvim

### undotree
Undotree visualizes the undo history and makes it easy to browse and switch between different undo branches.
https://github.com/mbbill/undotree

### nvim-cmp


## Lua Snip

https://github.com/L3MON4D3/LuaSnip


### LSP Zero
https://lsp-zero.netlify.app/v3.x/guide/integrate-with-mason-nvim
https://lsp-zero.netlify.app/v3.x/getting-started.html

## Other Resources
NVChad
https://github.com/NvChad/NvChad

neovim LSP setup
https://andrewcourter.substack.com/p/neovim-lsp-basics

linting and formatting
https://andrewcourter.substack.com/p/configure-linting-formatting-ang

neovim lua guide
https://neovim.io/doc/user/lua-guide.html

## Key Mappings

|key|action|
|---|------|
|C-n|Toggle nvim-tree|
|<leader>u|undo tree|
