local opt = require 'ataraxis.options'

local function set_pad_width()
    local options = opt.get()

    local pad_width = (vim.o.columns - options.width) / 2
    vim.cmd('exe "vertical resize ' .. pad_width .. '"')
end

return set_pad_width
