require("core.command")
require("core.keymap")
require("core.set")

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

require("lazy").setup({
  spec = {
    {import = "plugin"},
    {import = "plugin.themes"},
  },
  {
    defaults = {
      -- Lazy-load by default
      lazy = true,
      -- Use the latest version of the plugin (screw semantic versioning)
      version = false,
    },
    performance = {
      rtp = {
        disabled_plugins = {
          "gzip",
          "tarPlugin",
          "tohtml",
          "zipPlugin",
          "matchit",
          "matchparen",
          "netrwPlugin",
          "rplugin",
          "nvim",
          "tutor",
          -- "spellfile",
        },
      },
    },
  },
})
