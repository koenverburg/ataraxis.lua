require 'ataraxis.quit_buffer_or_nvim'
require 'ataraxis.adjust_pads'

local function autocommands()
    -- prevent focusing on pads
    vim.cmd('autocmd! BufEnter leftbuffer wincmd l')
    vim.cmd('autocmd! BufEnter rightbuffer wincmd h')

    -- commands for closing buffers without breaking layout
    vim.cmd('command! AtaraxisClose call v:lua.quit_buffer_or_nvim()')
    vim.cmd('command! AtaraxisForceClose call v:lua.quit_buffer_or_nvim({ "force": 1 })')

    -- adjust pads on resize
    vim.cmd('autocmd! VimResized * call v:lua.adjust_pads()')
end

return autocommands
