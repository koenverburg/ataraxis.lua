local set_pad_width = require 'ataraxis.set_pad_width'
local set_pad_options = require 'ataraxis.set_pad_options'

local function add_pads()
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
