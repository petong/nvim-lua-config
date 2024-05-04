
### General

| Keybinding          | Description                            |
|---------------------|----------------------------------------|
| `<F1>`              | Disabled (mapped to `<nop>`)           |
| `<leader>`          | Set to `\\`                            |
| `<leader><space>`   | Unhighlight search results             |
| `<leader>\|`        | Toggle cursor column                   |
| `Y`                 | Yank from cursor to the end of line    |

### NvimTree

| Keybinding | Description                   |
|------------|-------------------------------|
| `<C-n>`    | Toggle NvimTree file explorer |

### Trouble

| Keybinding   | Description                          |
|--------------|--------------------------------------|
| `<leader>xx` | Toggle Trouble plugin                |
| `<leader>xw` | Toggle Trouble workspace diagnostics |
| `<leader>xd` | Toggle Trouble document diagnostics  |
| `<leader>xq` | Toggle Trouble quickfix list         |
| `<leader>xl` | Toggle Trouble location list         |
| `gR`         | Toggle Trouble LSP references        |

### nvim-cmp

| Keybinding      | Description                           |
|-----------------|---------------------------------------|
| `<Up>`          | Select previous item in completion menu |
| `<Down>`        | Select next item in completion menu     |
| `<C-p>`         | Select previous item in completion menu |
| `<C-n>`         | Select next item in completion menu     |
| `<C-u>`         | Scroll docs up in completion menu       |
| `<C-d>`         | Scroll docs down in completion menu     |
| `<C-Space>`     | Trigger completion                      |
| `<C-e>`         | Abort completion                        |
| `<CR>`          | Confirm selection in completion menu    |

### LuaSnip

| Keybinding | Description              |
|------------|--------------------------|
| `<C-f>`    | Jump forward in snippet  |
| `<C-b>`    | Jump backward in snippet |

### LSP

| Keybinding | Description                 |
|------------|-----------------------------|
| `K`        | Show hover information      |
| `gd`       | Go to definition            |
| `gD`       | Go to declaration           |
| `gi`       | Go to implementation        |
| `go`       | Go to type definition       |
| `gr`       | Go to references            |
| `gs`       | Show signature help         |
| `<F2>`     | Rename symbol               |
| `<F3>`     | Format code                 |
| `<F4>`     | Show code actions           |
| `<leader>e`| Open diagnostic float       |

### nvim-dap

| Keybinding  | Description                            |
|-------------|----------------------------------------|
| `<leader>rr`| Toggle DAP (Debug Adapter Protocol) REPL |

### toggleterm

| Keybinding  | Description                     |
|-------------|---------------------------------|
| `<leader>tt`| Send current line to terminal   |
| `<leader>g` | Toggle Lazygit terminal         |

### Telescope

| Keybinding     | Description                                 |
|----------------|---------------------------------------------|
| `<C-p>`        | Open Telescope git files finder             |
| `<leader>pws`  | Telescope grep string for word under cursor |
| `<leader>pWs`  | Telescope grep string for WORD under cursor |
| `<leader>ps`   | Telescope grep string with input prompt     |
| `<leader>ff`   | Telescope find files                        |
| `<leader>fw`   | Telescope find word (grep)                  |
| `<leader>fg`   | Telescope live grep                         |
| `<leader>fd`   | Telescope diagnostics                       |
| `<leader>fb`   | Telescope buffers                           |
| `<leader>fh`   | Telescope help tags                         |

Remember that the `<leader>` key is set to `\\` in the configuration, so keybindings that include `<leader>` would be triggered by pressing `\\` followed by the specified key(s).
