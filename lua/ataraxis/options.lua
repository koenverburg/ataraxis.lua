local default_options = {
    width = 80
}

local options = vim.deepcopy(default_options)

local M = {}

M.set = function(user_options)
    options = vim.tbl_deep_extend('force', options, user_options)
end

M.get = function()
    return options
end

return M
