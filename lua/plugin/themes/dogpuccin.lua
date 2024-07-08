local M = {}

M.colors = {
    bg = "#000000",        -- Pure black background
    fg = "#D8DEE9",        -- Nord-like foreground
    black = "#3B4252",     -- Darker shade for contrast
    red = "#BF616A",       -- Nord's red, part of Aurora
    green = "#A3BE8C",     -- Original Nord's green, part of Aurora
    yellow = "#88C0D0",    -- Replaced with Nord's cyan for a cooler tone
    blue = "#81A1C1",      -- Nord's blue, part of Frost
    purple = "#B48EAD",    -- Nord's purple, part of Aurora
    cyan = "#5E81AC",      -- Darker blue from Nord palette
    white = "#E5E9F0",     -- Nord's light shade
    orange = "#ECEFF4",    -- Replaced with Nord's lightest shade for less warmth
    comment = "#4C566A",   -- Nord's muted color for comments
}

M.dogpuccin = {
    normal = {
        a = { fg = M.colors.bg, bg = M.colors.blue, gui = "bold" },
        b = { fg = M.colors.white, bg = M.colors.black },
        c = { fg = M.colors.fg, bg = M.colors.bg }
    },
    insert = { a = { fg = M.colors.bg, bg = M.colors.green, gui = "bold" } },
    visual = { a = { fg = M.colors.bg, bg = M.colors.purple, gui = "bold" } },
    replace = { a = { fg = M.colors.bg, bg = M.colors.red, gui = "bold" } },
    command = { a = { fg = M.colors.bg, bg = M.colors.cyan, gui = "bold" } },
    inactive = {
        a = { fg = M.colors.fg, bg = M.colors.bg, gui = "bold" },
        b = { fg = M.colors.fg, bg = M.colors.bg },
        c = { fg = M.colors.fg, bg = M.colors.bg }
    }
}

function M.load()
    -- Set up the colorscheme
    vim.cmd("hi clear")
    vim.o.background = "dark"
    vim.o.termguicolors = true
    vim.g.colors_name = "dogpuccin"

    -- Define highlight groups
    local function hi(group, opts)
        vim.api.nvim_set_hl(0, group, opts)
    end

    -- Syntax highlighting
    hi("Comment", { fg = M.colors.comment, italic = true })
    hi("Constant", { fg = M.colors.cyan })
    hi("String", { fg = M.colors.green })
    hi("Identifier", { fg = M.colors.blue })
    hi("Function", { fg = M.colors.purple })
    hi("Statement", { fg = M.colors.blue })
    hi("PreProc", { fg = M.colors.cyan })
    hi("Type", { fg = M.colors.purple })
    hi("Special", { fg = M.colors.cyan })
    hi("Underlined", { fg = M.colors.cyan, underline = true })
    hi("Error", { fg = M.colors.red })
    hi("Todo", { fg = M.colors.purple, bold = true, italic = true })

    -- UI elements
    hi("Normal", { fg = M.colors.fg, bg = M.colors.bg })
    hi("LineNr", { fg = M.colors.comment })
    hi("CursorLine", { bg = M.colors.black })
    hi("CursorLineNr", { fg = M.colors.white, bold = true })
    hi("SignColumn", { bg = M.colors.bg })
    hi("VertSplit", { fg = M.colors.black, bg = M.colors.bg })
    hi("StatusLine", { fg = M.colors.white, bg = M.colors.black })
    hi("StatusLineNC", { fg = M.colors.comment, bg = M.colors.black })
    hi("Pmenu", { fg = M.colors.fg, bg = M.colors.black })
    hi("PmenuSel", { fg = M.colors.bg, bg = M.colors.blue })
    hi("Search", { fg = M.colors.bg, bg = M.colors.blue })
    hi("IncSearch", { fg = M.colors.bg, bg = M.colors.cyan })
    hi("Folded", { fg = M.colors.comment, bg = M.colors.black })

    -- Set up lualine
    local lualine = require('lualine')
    lualine.setup {
        options = {
            theme = M.dogpuccin,
            component_separators = '|',
            section_separators = { left = '', right = '' },
        },
        sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch', 'diff', 'diagnostics'},
            lualine_c = {'filename'},
            lualine_x = {'encoding', 'fileformat', 'filetype'},
            lualine_y = {'progress'},
            lualine_z = {'location'}
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {'filename'},
            lualine_x = {'location'},
            lualine_y = {},
            lualine_z = {}
        },
    }
end

-- Lazy plugin specification
return {
    "dogpuccin",
    name = "dogpuccin",
    lazy = false,
    priority = 1000,
    config = function()
        M.load()
    end,
}
