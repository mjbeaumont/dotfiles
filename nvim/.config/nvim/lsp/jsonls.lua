local capabilities = require("core/lsp/capabilities")

return {
    settings = {
        json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
        },
    },
    capabilities = capabilities,
}
