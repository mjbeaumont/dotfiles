return {
    "vim-test/vim-test",
    event = "BufEnter",
    dependencies = { "akinsho/toggleterm.nvim" },
    config = function()
        vim.g["test#javascript#jest#file_pattern"] = "\\vtest\\.(js|jsx|ts|tsx)$"
        vim.g["test#javascript#jest#executable"] = "NODE_ENV=test node_modules/.bin/jest"
        vim.cmd('let g:test#enabled_runners = ["javascript#jest"]')
        vim.g["test#strategy"] = "toggleterm"

        local function getJestCwd()
            local lsputil = require("lspconfig.util")

            -- path of the current buffer, relative to the cwd
            local currentBufferFilePath = vim.fn.expand("%:~:.")

            local pkgJsonParentDir = lsputil.find_package_json_ancestor(currentBufferFilePath)
            print(pkgJsonParentDir)
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
    end,
    keys = {

        {
            "<Leader>tf",
            ":TestFile<CR>",
            desc = "Run all tests in file",
        },
        {
            "<Leader>tn",
            ":TestNearest<CR>",
            desc = "Run nearest test",
        },
        {
            "<Leader>ts",
            ":TestSuite<CR>",
            desc = "Run test suite",
        },
        {
            "<Leader>tl",
            ":TestLast<CR>",
            desc = "Run last test",
        },
    },
}
