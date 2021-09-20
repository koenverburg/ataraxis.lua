local options = require 'ataraxis.options'
local set_pad_width = require 'ataraxis.set_pad_width'
local set_pad_options = require 'ataraxis.set_pad_options'
local get_buffers = require 'helpers.nvim_get_buffers'

local function add_pads()
    local window_too_narrow = vim.o.columns < options.get().width
    local pads_exist = get_buffers() == "leftbuffer rightbuffer"

    if window_too_narrow or pads_exist then return end

    if vim.o.splitright then vim.o.splitright = false end

    vim.cmd('vnew leftbuffer')
    set_pad_width()
    set_pad_options()
    vim.cmd('wincmd l')

    vim.o.splitright = true

    vim.cmd('vnew rightbuffer')
    set_pad_width()
    set_pad_options()
    vim.cmd('wincmd h')
end

return add_pads
