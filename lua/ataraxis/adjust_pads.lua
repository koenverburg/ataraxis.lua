local opt = require 'ataraxis.options'
local add_pads = require 'ataraxis.add_pads'

function _G.adjust_pads()
    local options = opt.get()
    if o.columns <= options.width then
        -- remove paddings on shrinking
        vim.cmd('bw! leftbuffer rightbuffer')
    elseif vim.fn.bufwinnr('leftbuffer') == -1 then
        -- re-add paddings after expanding
        add_pads()
    else
        -- adjust pads width on resize
        g.eventignore = 'BufEnter'
        vim.cmd('wincmd h')
        set_pad_width()
        vim.cmd('wincmd l')

        vim.cmd('wincmd l')
        set_pad_width()
        vim.cmd('wincmd h')
        g.eventignore = ''
    end
end
