require "ataraxis.quit_buffer_or_nvim"
require "ataraxis.adjust_pads"

-- prevent focusing on pads and adjust their width when vim resizes
vim.cmd [[
    augroup ataraxis
        autocmd!
        autocmd BufEnter {leftbuffer,rightbuffer} call v:lua.quit_buffer_or_nvim()
        autocmd VimResized * call v:lua.adjust_pads()
    augroup end
]]
