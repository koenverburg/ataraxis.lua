package = "ataraxis"
version = "dev-1"
source = {
   url = "git+ssh://git@github.com/henriquehbr/ataraxis.lua"
}
description = {
   summary = "> A _(no-bullshit)_ zen mode for improving code readability on neovim",
   detailed = "> A _(no-bullshit)_ zen mode for improving code readability on neovim",
   homepage = "https://github.com/henriquehbr/ataraxis.lua",
   license = "MIT"
}
dependencies = {
    "luacheck >= 0.24.0-2"
}
build = {
   type = "builtin",
   modules = {
      ["ataraxis.add_pads"] = "lua/ataraxis/add_pads.lua",
      ["ataraxis.adjust_pads"] = "lua/ataraxis/adjust_pads.lua",
      ["ataraxis.autocommands"] = "lua/ataraxis/autocommands.lua",
      ["ataraxis.get_listed_buffers"] = "lua/ataraxis/get_listed_buffers.lua",
      ["ataraxis.init"] = "lua/ataraxis/init.lua",
      ["ataraxis.options"] = "lua/ataraxis/options.lua",
      ["ataraxis.quit_buffer_or_nvim"] = "lua/ataraxis/quit_buffer_or_nvim.lua",
      ["ataraxis.set_pad_options"] = "lua/ataraxis/set_pad_options.lua",
      ["ataraxis.set_pad_width"] = "lua/ataraxis/set_pad_width.lua"
   }
}
