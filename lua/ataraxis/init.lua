local options = require 'ataraxis.options'
local add_pads = require 'ataraxis.add_pads'
local autocommands = require 'ataraxis.autocommands'

local M = {}

function M.setup(custom_options)
    local user_options = custom_options or {}

    options.set(user_options)

    -- replace window names on status bar with "─"
    vim.o.statusline = '─'
    vim.o.fillchars = 'stlnc:─'

    add_pads()
    autocommands()
end

return M
