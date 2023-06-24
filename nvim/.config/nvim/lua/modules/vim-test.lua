local set_km = require("modules/utils")

set_km("n", "<Leader>tf", ":TestFile<CR>")
set_km("n", "<Leader>tn", ":TestNearest<CR>")
set_km("n", "<Leader>ts", ":TestSuite<CR>")
set_km("n", "<Leader>tl", ":TestLast<CR>")

vim.g["test#javascript#jest#file_pattern"] = "\\vtest\\.(js|jsx|ts|tsx)$"
vim.g["test#javascript#jest#executable"] = "NODE_ENV=test node_modules/.bin/jest"
vim.cmd('let g:test#enabled_runners = ["javascript#jest"]')
vim.g["test#strategy"] = "floaterm"

local function getJestCwd()
    local lsputil = require("lspconfig.util")

    -- path of the current buffer, relative to the cwd
    local currentBufferFilePath = vim.fn.expand("%:~:.")

    local pkgJsonParentDir = lsputil.find_package_json_ancestor(currentBufferFilePath)
    return pkgJsonParentDir
end

_G.setJestCwd = function()
    vim.g["test#project_root"] = getJestCwd()
end

vim.cmd([[
  augroup test
  autocmd!
  autocmd BufEnter *.tsx,*.ts,*.js,*.jsx call v:lua.setJestCwd()
  augroup END
]])
