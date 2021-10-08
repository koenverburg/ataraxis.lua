local function quit_buffer_or_nvim()
    local opened_windows = vim.fn.winnr "$"
    local current_buffer_name = vim.fn.bufname "%"

    if opened_windows > 3 then
        -- close only split
        vim.cmd "quit"
    elseif opened_windows < 3 then
        -- close last remaining buffer (alongside pads)
        vim.cmd "quitall"
    elseif current_buffer_name == "leftbuffer" then
        -- prevent focusing on left pad
        vim.cmd "wincmd l"
    elseif current_buffer_name == "rightbuffer" then
        -- prevent focusing on right pad
        vim.cmd "wincmd h"
    else
        -- close only the current buffer (keep pads)
        vim.cmd "bprevious"
        vim.cmd "bdelete#"
    end
end

return quit_buffer_or_nvim
