local M = {}

-- Project-local TypeScript SDK
M.get_tsdk = function()
    local tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib"
    if vim.fn.isdirectory(tsdk) ~= 1 then
        vim.notify("No project TypeScript found", vim.log.levels.WARN)
        return nil
    end
    return tsdk
end

return M
