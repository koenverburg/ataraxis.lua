local get_listed_buffers = require 'ataraxis.get_listed_buffers'

function _G.quit_buffer_or_nvim(opts)
    local options = opts or { force = false }

    local opened_windows = vim.fn.winnr('$')

    if opened_windows > 3 then
        -- close only split
        vim.cmd(options.force and 'q!' or 'q')
    elseif #get_listed_buffers() < 2 then
        -- close last remaining buffer (alongside pads)
        vim.cmd(options.force and 'qa!' or 'qa')
    else
        -- close only the current buffer (keep pads)
        vim.cmd(options.force and 'bprev | bd#!' or 'bprev | bd#')
    end
end
