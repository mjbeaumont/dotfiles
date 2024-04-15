local M = {}

M.getOpts = function(on_attach, capabilities)
    return {
        settings = {
            json = {
                schemas = require("schemastore").json.schemas({
                    select = {
                        "package.json",
                        "tsconfig.json",
                    },
                }),
                validate = { enable = true },
            },
        },
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

return M
