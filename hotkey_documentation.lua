-- document hotkeys in a markdown file
-- Usage: luafile hotkey_documentation.lua
--
-- This script reads the init.lua file and extracts the hotkey definitions
-- to generate a Markdown file containing the hotkeys associated with each plugin.
-- The hotkeys are grouped by plugin and sorted by mode (normal, insert, visual, etc.).
-- The Markdown file is saved as hotkeys.md in the same directory as the init.lua file.
-- The hotkey definitions are expected to be in the following format:
--  vim.keymap.set({mode}, {keybinding}, {command})
local function generate_hotkey_documentation()
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

  -- Custom environment to capture hotkey definitions
  local env = {}
  setmetatable(env, { __index = _G })

  env.vim = setmetatable({}, {
    __index = function(_, key)
      if key == "keymap" then
        return setmetatable({}, {
          __index = function(_, key)
            if key == "set" then
              return function(mode, keybinding, command, ...)
                -- Extract the plugin name from the command
                local plugin_name = "General"
                if type(command) == "string" then
                  local plugin_match = command:match("require%(%s*[\"'](.+)[\"']")
                  if plugin_match then
                    plugin_name = plugin_match
                  end
                end

                if not plugin_hotkeys[plugin_name] then
                  plugin_hotkeys[plugin_name] = {}
                end
                table.insert(plugin_hotkeys[plugin_name], { mode = mode, keybinding = keybinding, command = command })
              end
            end
          end
        })
      elseif key == "fn" then
        return vim.fn -- Use the original vim.fn function
      else
        return vim[key] -- Fallback to the original vim table
      end
    end
  })

  -- Recursive function to load Lua files with the custom environment
  local function load_directory(dir)
    -- Iterate over files and directories in the current directory
    for _, file in ipairs(vim.fn.readdir(dir)) do
      local path = dir .. "/" .. file
      if vim.fn.isdirectory(path) == 1 then
        -- Recursively load subdirectories
        load_directory(path)
      elseif file:match("%.lua$") then
        -- Load Lua files with the custom environment
        local chunk, err = loadfile(path, "t", env)
        if chunk then
          chunk()
        else
          print("Error loading file: " .. path .. "\n" .. err)
        end
      end
    end
  end

  -- Start loading from the lua directory
  load_directory(vim.fn.stdpath("config") .. "/lua")

  -- Write the hotkey information to the Markdown file, grouped by plugin
  for plugin_name, hotkeys in pairs(plugin_hotkeys) do
    output_file:write("## " .. plugin_name .. "\n\n")
    for _, hotkey in ipairs(hotkeys) do
      output_file:write("### " .. hotkey.mode .. " mode\n")
      output_file:write("- `" .. hotkey.keybinding .. "`: " .. tostring(hotkey.command) .. "\n\n")
    end
    output_file:write("\n")
  end

  -- Close the Markdown file
  output_file:close()

  print("Hotkey documentation generated: " .. vim.fn.stdpath("config") .. "/hotkeys.md")
end

-- Call the function to generate the hotkey documentation
generate_hotkey_documentation()
