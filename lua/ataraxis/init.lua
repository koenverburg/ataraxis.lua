require "ataraxis.autocommands"

local options = require "ataraxis.options"
local add_pads = require "ataraxis.add_pads"

local M = {}

function M.setup(user_options)
    options.set(user_options)
    add_pads()
end

return M
