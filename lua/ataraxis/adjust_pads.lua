local options_store = require "ataraxis.options"
local add_pads = require "ataraxis.add_pads"
local set_pad_width = require "ataraxis.set_pad_width"

local function adjust_pads()
    local options = options_store.get()
    if vim.o.columns <= options.width then
        -- remove paddings on shrinking
        vim.cmd "bw! leftbuffer rightbuffer"
    elseif vim.fn.bufwinnr "leftbuffer" == -1 then
        -- re-add paddings after expanding
        add_pads()
    else
        -- adjust pads width on resize
        vim.g.eventignore = "BufEnter"
        vim.cmd "wincmd h"
        set_pad_width()
        vim.cmd "wincmd l"

        vim.cmd "wincmd l"
        set_pad_width()
        vim.cmd "wincmd h"
        vim.g.eventignore = ""
    end
end

return adjust_pads
