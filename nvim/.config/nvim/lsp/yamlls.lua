local capabilities = require("core/lsp/capabilities")

return {
    settings = {
        yaml = {
            validate = { enabled = true },
            schemaStore = {
                enable = false,
                url = "",
            },
            schemas = require("schemastore").json.schemas({
               'docker-compose.yaml',
               'kustomization.yaml',
               'github-action.yaml',
               'github-workflow.yaml',
            }),
        },
    },
    capabilities = capabilities,
}
