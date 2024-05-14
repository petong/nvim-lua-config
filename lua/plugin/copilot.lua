return {
  {
    "github/copilot.vim",
    config = function ()
      vim.g.copilot_enabled = true

      -- Configure Copilot panel
      vim.g.copilot_panel_enabled = true
      vim.g.copilot_panel_launch_message = true
      vim.g.copilot_panel_default_position = "right"
      vim.g.copilot_panel_default_width = 30

      -- Configure Copilot suggestions
      vim.g.copilot_suggestion_hidden = false
      vim.g.copilot_suggestion_highlight_group = "CopilotSuggestion"
      vim.cmd [[highlight CopilotSuggestion guifg=#555555 ctermfg=8]]

    end,

  }
}

