local M = {}

M.setup = function()
    -- define symbols
    local signs = {
        { name = "DiagnosticSignError", text = " " },
        { name = "DiagnosticSignWarn", text = " " },
        { name = "DiagnosticSignHint", text = " " },
        { name = "DiagnosticSignInfo", text = " " },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    -- settings
    local config = {
        virtual_text = true,
        signs = {
            active = signs,
        },
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }

    vim.diagnostic.config(config)

    local border = {
        { "🭽", "FloatBorder" },
        { "▔", "FloatBorder" },
        { "🭾", "FloatBorder" },
        { "▕", "FloatBorder" },
        { "🭿", "FloatBorder" },
        { "▁", "FloatBorder" },
        { "🭼", "FloatBorder" },
        { "▏", "FloatBorder" },
    }
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = border,
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = border,
    })
end

local function lsp_highlight_document(client)
    -- Set autocommands conditional on server_capabilities
    if client.server_capabilities.document_highlight then
        vim.api.nvim_exec(
            [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
            false
        )
    end
end

local function lsp_keymaps(bufnr)
    local set_km = vim.api.nvim_buf_set_keymap
    local opts = { noremap = true, silent = true }
    set_km(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    set_km(bufnr, "n", "gd", "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>", opts)
    set_km(bufnr, "n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    set_km(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    set_km(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    set_km(bufnr, "n", "gr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>", opts)
    set_km(bufnr, "n", "ga", "<cmd>:CodeActionMenu<CR>", opts)
    set_km(bufnr, "n", "[d", "<cmd>lua vim.diagnostic.goto_prev({ border = 'rounded' })<CR>", opts)
    set_km(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    set_km(bufnr, "n", "]d", "<cmd>lua vim.diagnostic.goto_next({ border = 'rounded' })<CR>", opts)
    vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
end

-- use lsp formatting if it's available (and if it's good)
-- otherwise, fall back to null-ls

local preferred_formatting_clients = { "eslint" }

_G.formatting = function(bufnr)
    bufnr = tonumber(bufnr) or vim.api.nvim_get_current_buf()

    local selected_client
    for _, client in ipairs(vim.lsp.buf_get_clients(bufnr)) do
        if vim.tbl_contains(preferred_formatting_clients, client.name) then
            selected_client = client
            break
        end
    end

    if not selected_client then
        return
    end

    local params = vim.lsp.util.make_formatting_params()
    selected_client.request("textDocument/formatting", params, function(err, res)
        if err then
            local err_msg = type(err) == "string" and err or err.message
            vim.notify("global.lsp.formatting: " .. err_msg, vim.log.levels.WARN)
            return
        end

        if not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_buf_get_option(bufnr, "modified") then
            return
        end

        if res then
            vim.lsp.util.apply_text_edits(res, bufnr, selected_client.offset_encoding or "utf-16")
            vim.api.nvim_buf_call(bufnr, function()
                vim.cmd("silent noautocmd update")
            end)
        end
    end, bufnr)
end

M.on_attach = function(client, bufnr)
    lsp_keymaps(bufnr)
    lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
