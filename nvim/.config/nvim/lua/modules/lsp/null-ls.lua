local null_ls = require("null-ls")
local b = null_ls.builtins

local with_diagnostics_code = function(builtin)
    return builtin.with({
        diagnostics_format = "#{m} [#{c}]",
    })
end

local with_root_file = function(builtin, file)
    return builtin.with({
        condition = function(utils)
            return utils.root_has_file(file)
        end,
    })
end

local sources = {
    -- formatting
    b.formatting.efm,
    with_root_file(b.formatting.stylua, "stylua.toml"),
    -- diagnostics
    with_root_file(b.diagnostics.selene, "selene.toml"),
    b.diagnostics.efm,
    b.diagnostics.write_good,
    b.diagnostics.markdownlint,
    b.diagnostics.teal,
    b.diagnostics.tsc,
    -- code actions
    b.code_actions.efm,
    b.code_actions.gitsigns,
    b.code_actions.gitrebase,
    -- hover
    b.hover.dictionary,
}

local M = {}
M.setup = function(on_attach)
    null_ls.setup({
        -- debug = true,
        sources = sources,
        on_attach = on_attach,
    })
end

return M
