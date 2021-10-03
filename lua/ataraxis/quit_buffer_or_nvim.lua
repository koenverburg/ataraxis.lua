local get_buffers = require 'helpers.nvim_get_buffers'

function _G.quit_buffer_or_nvim(opts)
    local options = opts or { force = false }

    local opened_windows = vim.fn.winnr('$')
    local visible_buffers = #get_buffers('buflisted(v:val)')

    if opened_windows > 3 then
        -- close only split
        vim.cmd(options.force and 'q!' or 'q')
    elseif visible_buffers < 2 then
        -- close last remaining buffer (alongside pads)
        vim.cmd(options.force and 'qa!' or 'qa')
    else
        -- close only the current buffer (keep pads)
        vim.cmd(options.force and 'bprev | bd#!' or 'bprev | bd#')
    end
end
