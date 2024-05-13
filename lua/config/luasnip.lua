return {
    require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/snippets/"}),
    require("luasnip.loaders.from_vscode").load(),
    require("luasnip").config.set_config({
      history = true,
      updateevents = "TextChanged,TextChangedI",
    })

}
