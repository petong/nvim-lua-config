return {
  "nvim-telescope/telescope.nvim",

  tag = "0.1.8",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    "xiyaowong/telescope-emoji.nvim"
  },

  config = function()
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")

    require('telescope').setup({
      defaults = {
        mappings = {
          i = {
            ["<Tab>"] = actions.toggle_selection + actions.move_selection_next,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_previous,
            ["<CR>"] = function(prompt_bufnr)
              local picker = action_state.get_current_picker(prompt_bufnr)
              local selected_entries = picker:get_multi_selection()

              -- If no multiple selections, perform default action
              if #selected_entries == 0 then
                actions.select_default(prompt_bufnr)
                return
              end

              -- Custom handling for multiple selections
              actions.close(prompt_bufnr)
              for _, entry in ipairs(selected_entries) do
                -- Check if we're dealing with a buffer entry
                if entry.bufnr then
                  vim.cmd("buffer " .. entry.bufnr)
                else
                  vim.cmd("edit " .. entry.value)
                end
              end
            end,
          },
          n = {
            ["<Tab>"] = actions.toggle_selection + actions.move_selection_next,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_previous,
            ["<CR>"] = function(prompt_bufnr)
              local picker = action_state.get_current_picker(prompt_bufnr)
              local selected_entries = picker:get_multi_selection()

              -- If no multiple selections, perform default action
              if #selected_entries == 0 then
                actions.select_default(prompt_bufnr)
                return
              end

              -- Custom handling for multiple selections
              actions.close(prompt_bufnr)
              for _, entry in ipairs(selected_entries) do
                -- Check if we're dealing with a buffer entry
                if entry.bufnr then
                  vim.cmd("buffer " .. entry.bufnr)
                else
                  vim.cmd("edit " .. entry.value)
                end
              end
            end,
          },
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {
            -- even more opts
          }
        },
        ["emoji"] = {
          action = function(emoji)
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
    vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind current [W]ord' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
    vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind [B]uffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
    require("telescope").load_extension("ui-select")
    require("telescope").load_extension("emoji")
  end
}
