local function get_listed_buffers()
    local listed_buffers = {}

    for buffer=1, fn.bufnr('$') do
        if fn.buflisted(buffer) == 1 then
            table.insert(listed_buffers, buffer)
        end
    end

    return listed_buffers
end

return get_listed_buffers
