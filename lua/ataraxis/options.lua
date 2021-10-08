local M = {}

local default_options = {
    width = 80,
}

local options = {}

function M.set(user_options)
    local user_fallback_options = user_options or {}
    options = vim.tbl_deep_extend(
        "force",
        user_fallback_options,
        default_options
    )
end

function M.get()
    return options
end

return M
