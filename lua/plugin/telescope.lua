return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.6",

    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
        "xiyaowong/telescope-emoji.nvim"
    },

    config = function()
        require('telescope').setup({
          extensions = {
            ["ui-select"] = {
              require("telescope.themes").get_dropdown {
                -- even more opts
              }

              -- pseudo code / specification for writing custom displays, like the one
              -- for "codeactions"
              -- specific_opts = {
              --   [kind] = {
              --     make_indexed = function(items) -> indexed_items, width,
              --     make_displayer = function(widths) -> displayer
              --     make_display = function(displayer) -> function(e)
              --     make_ordinal = function(e) -> string
              --   },
              --   -- for example to disable the custom builtin "codeactions" display
              --      do the following
              --   codeactions = false,
              -- }
            },
            ["emoji"] = {
              action = function(emoji)
                -- argument emoji is a table.
                -- {name="", value="", cagegory="", description=""}

--              vim.fn.setreg("*", emoji.value)
--              print([[Press p or "*p to paste this emoji]] .. emoji.value)

                -- insert emoji when picked
                 vim.api.nvim_put({ emoji.value }, 'c', false, true)
              end,
            }
          }
        })

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>pws', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>pWs', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
        vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[F]inf current [W]ord' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
        vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind [B]uffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
        require("telescope").load_extension("ui-select")
        require("telescope").load_extension("emoji")
    end
}

