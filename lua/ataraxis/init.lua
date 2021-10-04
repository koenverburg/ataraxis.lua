require "ataraxis.autocommands"

local add_pads = require "ataraxis.add_pads"

local M = {}

_G.ataraxis = {}

local default_options = {
    width = 80,
}

function M.setup(user_options)
    local options = user_options or {}
    _G.ataraxis.options = vim.tbl_deep_extend("force", options, default_options)

    add_pads()
end

return M
