-- prevent focusing on pads and adjust their width when vim resizes
vim.cmd [[
    augroup ataraxis
        autocmd!
        autocmd BufEnter {leftbuffer,rightbuffer} lua require('ataraxis.quit_buffer_or_nvim')()
        autocmd VimResized * lua require('ataraxis.adjust_pads')()
    augroup end
]]
