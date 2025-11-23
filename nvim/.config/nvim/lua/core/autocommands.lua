local api = vim.api

local general = api.nvim_create_augroup("_general_settings", { clear = true })

-- highlight on yank
api.nvim_create_autocmd("TextYankPost", {
    group = general,
    callback = function()
        vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
    end,
})

-- disable folding 
local nofold = vim.api.nvim_create_augroup("nofold_files", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
    group = nofold,
    pattern = { "json", "jsonc", "yaml", "yml" },
    callback = function()
        -- Disable folding completely
        vim.opt_local.foldenable = false
        vim.opt_local.foldmethod = "manual"
        vim.opt_local.foldexpr = "0"
    end,
})

