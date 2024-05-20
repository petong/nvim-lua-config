-- document hotkeys in a markdown file
-- Usage: luafile hotkey_documentation.lua
--
-- This script reads the init.lua file and extracts the hotkey definitions
-- to generate a Markdown file containing the hotkeys associated with each plugin.
-- The hotkeys are grouped by plugin and sorted by mode (normal, insert, visual, etc.).
-- The Markdown file is saved as hotkeys.md in the same directory as the init.lua file.
-- The hotkey definitions are expected to be in the following format:
--  vim.keymap.set({mode}, {keybinding}, {command})
--
--
--
local function generate_hotkey_documentation()
  -- Open the init.lua file for reading
  local init_file = io.open(vim.fn.stdpath("config") .. "/init.lua", "r")
  if not init_file then
    print("init.lua file not found.")
    return
  end

  -- Read the contents of the init.lua file
  local init_contents = init_file:read("*all")
  init_file:close()

  -- Open the Markdown file for writing
  local output_file = io.open(vim.fn.stdpath("config") .. "/hotkeys.md", "w")
  if not output_file then
    print("Failed to create hotkeys.md file.")
    return
  end

  -- Write the header to the Markdown file
  output_file:write("# Neovim Hotkeys\n\n")

  -- Table to store hotkeys associated with each plugin
  local plugin_hotkeys = {}

  -- Regular expression pattern to match hotkey definitions
  local pattern = "vim.keymap.set%([^%)]+%).-\n"

  -- Iterate over the hotkey definitions
  for hotkey in string.gmatch(init_contents, pattern) do
    -- Extract the mode, keybinding, and command from the hotkey definition
    local mode, keybinding, command = string.match(hotkey, "vim.keymap.set%(%s*'([^']+)',%s*'([^']+)',%s*'([^']+)'")
    if mode and keybinding and command then
      -- Extract the plugin name from the command
      local plugin_name = string.match(command, "require%(%s*'([^']+)'") or "General"
      if not plugin_hotkeys[plugin_name] then
        plugin_hotkeys[plugin_name] = {}
      end
      table.insert(plugin_hotkeys[plugin_name], {mode = mode, keybinding = keybinding, command = command})
    end
  end

  -- Write the hotkey information to the Markdown file, grouped by plugin
  for plugin_name, hotkeys in pairs(plugin_hotkeys) do
    output_file:write("## " .. plugin_name .. "\n\n")
    for _, hotkey in ipairs(hotkeys) do
      output_file:write("### " .. hotkey.mode .. " mode\n")
      output_file:write("- `" .. hotkey.keybinding .. "`: " .. hotkey.command .. "\n\n")
    end
    output_file:write("\n")
  end

  -- Close the Markdown file
  output_file:close()

  print("Hotkey documentation generated: " .. vim.fn.stdpath("config") .. "/hotkeys.md")
end

-- Call the function to generate the hotkey documentation
generate_hotkey_documentation()
