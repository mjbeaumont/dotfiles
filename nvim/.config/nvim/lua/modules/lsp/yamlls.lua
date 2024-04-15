local M = {}

M.getOpts = function(on_attach, capabilities)
    return {
        settings = {
            yaml = {
                validate = true,
                schemaStore = {
                    enable = false,
                    url = "",
                },
                schemas = {
                    ["https://json.schemastore.org/kustomization.json"] = "kustomization.{yml,yaml}",
                    ["https://raw.githubusercontent.com/docker/compose/master/compose/config/compose_spec.json"] = "docker-compose*.{yml,yaml}",
                    ["https://json.schemastore.org/github-action.json"] = "/.github",
                },
            },
        },
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

return M
