require 'ataraxis.autocommands'

local options = require 'ataraxis.options'
local add_pads = require 'ataraxis.add_pads'

local M = {}

function M.setup(custom_options)
    local user_options = custom_options or {}

    options.set(user_options)

    add_pads()
end

return M
