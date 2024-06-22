local colors = {
    bg = "#000000",        -- Pure black background
    fg = "#D8DEE9",        -- Nord-like foreground
    black = "#3B4252",     -- Darker shade for contrast
    red = "#BF616A",       -- Nord's red, part of Aurora
    green = "#A3BE8C",     -- Nord's green, part of Aurora
    yellow = "#EBCB8B",    -- Nord's yellow, part of Aurora
    blue = "#81A1C1",      -- Nord's blue, part of Frost
    purple = "#B48EAD",    -- Nord's purple, part of Aurora
    cyan = "#88C0D0",      -- Nord's cyan, part of Frost
    white = "#E5E9F0",     -- Nord's light shade
    orange = "#D08770",    -- Nord's orange, part of Aurora
    comment = "#4C566A",   -- Nord's muted color for comments
}

local dogpuccin = {
    normal = {
        a = { fg = colors.bg, bg = colors.blue, gui = "bold" },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.fg, bg = colors.bg }
    },
    insert = { a = { fg = colors.bg, bg = colors.green, gui = "bold" } },
    visual = { a = { fg = colors.bg, bg = colors.purple, gui = "bold" } },
    replace = { a = { fg = colors.bg, bg = colors.red, gui = "bold" } },
    command = { a = { fg = colors.bg, bg = colors.yellow, gui = "bold" } },
    inactive = {
        a = { fg = colors.fg, bg = colors.bg, gui = "bold" },
        b = { fg = colors.fg, bg = colors.bg },
        c = { fg = colors.fg, bg = colors.bg }
    }
}

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
hi("Comment", { fg = colors.comment, italic = true })
hi("Constant", { fg = colors.yellow })
hi("String", { fg = colors.green })
hi("Identifier", { fg = colors.blue })
hi("Function", { fg = colors.orange })
hi("Statement", { fg = colors.purple })
hi("PreProc", { fg = colors.cyan })
hi("Type", { fg = colors.yellow })
hi("Special", { fg = colors.orange })
hi("Underlined", { fg = colors.cyan, underline = true })
hi("Error", { fg = colors.red })
hi("Todo", { fg = colors.yellow, bold = true, italic = true })

-- UI elements
hi("Normal", { fg = colors.fg, bg = colors.bg })
hi("LineNr", { fg = colors.comment })
hi("CursorLine", { bg = colors.black })
hi("CursorLineNr", { fg = colors.white, bold = true })
hi("SignColumn", { bg = colors.bg })
hi("VertSplit", { fg = colors.black, bg = colors.bg })
hi("StatusLine", { fg = colors.white, bg = colors.black })
hi("StatusLineNC", { fg = colors.comment, bg = colors.black })
hi("Pmenu", { fg = colors.fg, bg = colors.black })
hi("PmenuSel", { fg = colors.bg, bg = colors.blue })
hi("Search", { fg = colors.bg, bg = colors.yellow })
hi("IncSearch", { fg = colors.bg, bg = colors.orange })
hi("Folded", { fg = colors.comment, bg = colors.black })

-- Set up lualine
local lualine = require('lualine')
lualine.setup {
    options = {
        theme = dogpuccin,
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

-- Return the theme for use in other files
return {
    colors = colors,
    highlights = hi,
    lualine = dogpuccin
}
