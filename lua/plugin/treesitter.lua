return {
    {"nvim-treesitter/nvim-treesitter",
      lazy = false,
      -- dependencies = {"nvim-treesitter/nvim-treesitter-textobjects"},
      build = ":TSUpdate",
      opts = {
         ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
         sync_install = false,  -- Install parsers synchronously (only applied to `ensure_installed`)
         auto_install = true,
         highlight = {
            enable = true
         },
         indent = {
            enable = false
         },
         incremental_selection = {
            enable = true,
            additional_vim_regex_highlighting = false,
            keymaps = {
               init_selection = '<c-space>',
               node_incremental = '<c-space>',
               scope_incremental = '<c-s>',
               node_decremental = '<M-space>',
            },
            disable = function(lang, buf)
               local max_filesize = 100 * 1024 -- 100 KB
               local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
               if ok and stats and stats.size > max_filesize then
                  return true
               else
                  return false
               end
            end,
         },
      },
      config = function(_, opts)
         require('nvim-treesitter.configs').setup({opts})
      end
    },

}

