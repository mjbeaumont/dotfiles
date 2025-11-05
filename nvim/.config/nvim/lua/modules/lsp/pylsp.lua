local M = {}

M.getOpts = function(on_attach, capabilities)
    return {
        settings = {
            on_attach = function(client, bufnr)
                on_attach(client, bufnr)
                -- Python specifically isn't setting omnifunc correctly, ftplugin conflict
                vim.api.buf_set_option_value('omnifunc', 'v:lua.vim.lsp.omnifunc', { buf = 0 })
            end,
        },
        flags = {
          debounce_text_changes = 200,
        },
        capabilities = capabilities
    }
end

return M

