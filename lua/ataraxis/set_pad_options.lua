local function set_pad_options()
    vim.wo.number = false
    vim.wo.relativenumber = false
    vim.wo.cursorline = false
    vim.wo.signcolumn = "no"
    vim.bo.buflisted = false
    vim.bo.modifiable = false
    vim.wo.statusline = " "
    vim.wo.fillchars = "stlnc: "
end

return set_pad_options
