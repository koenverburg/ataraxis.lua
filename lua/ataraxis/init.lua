local options = require 'ataraxis.options'
local add_pads = require 'ataraxis.add_pads'
local autocommands = require 'ataraxis.autocommands'

local get_listed_buffers = require 'ataraxis.get_listed_buffers'

local M = {}

g = vim.g
o = vim.o
wo = vim.wo
bo = vim.bo

function M.setup(custom_options)
    user_options = custom_options or {}

    options.set(user_options)

    add_pads()
    autocommands()
end

return M
