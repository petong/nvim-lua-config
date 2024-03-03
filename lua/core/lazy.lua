local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable",
      lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {
    defaults = {
        lazy = true,
    },
    install = {
        colorscheme = { "tokyonight" }
    },
    rtp = {
        disabled_plugins = {
            "gzip",
            "matchit",
            "matchparen",
            "netrw",
            "netrwplugin",
            "tarplugin",
            "tohtml",
            "tutor",
            "zipplugin",
        }
    },
    change_detection = {
        enabled = true,
        notify = true,
    },
}

require("lazy").setup({
	spec = "plugin",
    change_detection = { notify = true },
    opts
})

--[[
require("lazy").setup({
	spec = {
		-- add LazyVim and import its plugins
        {
          "folke/which-key.nvim",
          event = "VeryLazy",
          init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
          end,
          opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            }
        },
        "tpope/vim-fugitive",
        "NLKNguyen/papercolor-theme",
        "folke/tokyonight.nvim",
        { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
        {
            'nvim-telescope/telescope.nvim', tag = '0.1.5',
              dependencies = { 'nvim-lua/plenary.nvim' }
        },
        {
            'nvim-lualine/lualine.nvim',
            dependencies = { 'nvim-tree/nvim-web-devicons' }
        },


       {"nvim-treesitter/nvim-treesitter-context"},
       {"nvim-treesitter/nvim-treesitter", 
          lazy = true,
          -- dependencies = {"nvim-treesitter/nvim-treesitter-textobjects"},
          build = ":TSUpdate",
          opts = {
             sync_install = false,  -- Install parsers synchronously (only applied to `ensure_installed`)
             auto_install = false,
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

      {"nvim-tree/nvim-tree.lua",
          version = "*",
          lazy = false,
          dependencies = {
            "nvim-tree/nvim-web-devicons",
          },
          config = function()
            require("nvim-tree").setup {}
          end,
      }


	}
})
--]]
