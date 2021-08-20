local function set_pad_options()
    vim.wo.number = false
    vim.wo.relativenumber = false
    vim.wo.cursorline = false
    vim.bo.buflisted = false
    vim.bo.modifiable = false
end

return set_pad_options
