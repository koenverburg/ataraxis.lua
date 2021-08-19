local get_listed_buffers = require 'helpers.get_listed_buffers'

function _G.quit_buffer_or_nvim(opts)
    options = opts or { force = false }

    local opened_windows = fn.winnr('$')

    if opened_windows > 3 then
        -- close only split
        cmd(options.force and 'q!' or 'q')
    elseif #get_listed_buffers() < 2 then
        -- close last remaining buffer (alongside pads)
        cmd(options.force and 'qa!' or 'qa')
    else
        -- close only the current buffer (keep pads)
        cmd(options.force and 'bprev | bd#!' or 'bprev | bd#')
    end
end
