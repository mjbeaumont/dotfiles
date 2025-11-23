local capabilities = require("core/lsp/capabilities")

return {
    settings = {
        json = {
            schemas = require("schemastore").json.schemas({
                {
                    fileMatch = { "**/package.json" },
                    url = "https://json.schemastore.org/package.json",
                },
                {
                    fileMatch = { "**/tsconfig*.json" },
                    url = "https://json.schemastore.org/tsconfig.json",
                },
                {
                    fileMatch = { "**/jest.config.json" },
                    url = "https://json.schemastore.org/jest.json",
                },
            }),
            validate = true,
        },
    },
    capabilities = capabilities,
}
