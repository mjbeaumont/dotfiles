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

M.eslint_fix_all = function(opts)
    opts = opts or {}

    local bufnr = opts.bufnr or vim.api.nvim_get_current_buf()
    vim.validate("bufnr", bufnr, "number")

    local client = opts.client or vim.lsp.get_clients({ bufnr = bufnr, name = "eslint" })[1]

    if not client then
        return
    end

    local request

    if opts.sync then
        request = function(buf, method, params)
            client:request_sync(method, params, nil, buf)
        end
    else
        request = function(buf, method, params)
            client:request(method, params, nil, buf)
        end
    end

    request(bufnr, "workspace/executeCommand", {
        command = "eslint.applyAllFixes",
        arguments = {
            {
                uri = vim.uri_from_bufnr(bufnr),
                version = vim.lsp.util.buf_versions[bufnr],
            },
        },
    })
end

return M
