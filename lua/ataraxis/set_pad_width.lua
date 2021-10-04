local function set_pad_width()
    local pad_width = (vim.o.columns - _G.ataraxis.options.width) / 2
    vim.cmd("exe \"vertical resize " .. pad_width .. "\"")
end

return set_pad_width
