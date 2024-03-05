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
