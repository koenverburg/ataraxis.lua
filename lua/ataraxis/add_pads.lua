local options = require 'ataraxis.options'
local set_pad_width = require 'ataraxis.set_pad_width'
local set_pad_options = require 'ataraxis.set_pad_options'
local get_buffers = require 'helpers.nvim_get_buffers'
local has_element = require 'helpers.has_element'

local function add_pads()
    local buffers = get_buffers()
    local window_too_narrow = vim.o.columns < options.get().width
    local left_pad_exists = has_element(buffers, 'leftbuffer')
    local right_pad_exists = has_element(buffers, 'rightbuffer')
    local pads_exists = left_pad_exists or right_pad_exists

    if window_too_narrow or pads_exists then return end

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
