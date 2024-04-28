require("dap").adapters.python = {
    type = "executable",
    command = "/Users/jph/.zinit/plugins/pyenv---pyenv/shims/python3",
    args = { "-m", "debugpy.adapter" },
}

require("dap").configurations.python = {
    {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        pythonPath = function()
            return "/Users/jph/.zinit/plugins/pyenv---pyenv/shims/python3"
        end,
    },
}
vim.keymap.set("n", "<leader>rr", ":DapToggleRepl<CR>")