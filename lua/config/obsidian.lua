return {
    require("obsidian").setup({ 
        open_app_foreground = false,
        workspaces = {
          {
            name = "personal",
            path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/personal",
          },
          {
            name = "Ripple",
            path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Ripple",
          },
        },

        templates = {
            subdir = "templates",
            date_format = "%Y-%m-%d-%a",
            time_format = "%H:%M",
        },


        daily_notes = {
          -- Optional, if you keep daily notes in a separate directory.
          folder = "Journal/Daily",
          -- Optional, if you want to change the date format for the ID of daily notes.
          date_format = "%Y-%m-%d",
          -- Optional, if you want to change the date format of the default alias of daily notes.
          alias_format = "%B %-d, %Y",
          -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
          template = "Daily Template",
        },

        -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
        completion = {
          -- Set to false to disable completion.
          nvim_cmp = true,
          -- Trigger completion at 2 chars.
          min_chars = 2,
        },

        picker = {
       -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
          name = "telescope.nvim",
          -- Optional, configure key mappings for the picker. These are the defaults.
          -- Not all pickers support all mappings.
          mappings = {
            -- Create a new note from your query.
            new = "<C-x>",
            -- Insert a link to the selected note.
            insert_link = "<C-l>",
          },
        },

    })
}


