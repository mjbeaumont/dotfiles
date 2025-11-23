local capabilities = require("core/lsp/capabilities")

return {
    settings = {
        yaml = {
            validate = true,
            hover = true,
            completion = true,
            schemas = {
                -- Explicitly include only the schemas you need
                ["https://json.schemastore.org/github-workflow.json"] = ".github/**/*.{yml,yaml}",
                ["https://json.schemastore.org/docker-compose.json"] = "{,docker-}-compose*.{yml,yaml}",
                ["https://json.schemastore.org/kustomization.json"] = "kustomization*.{yml,yaml}",
            },
        },
    },
    capabilities = capabilities,
}
