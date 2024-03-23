return {
    "echasnovski/mini.files",
    config = function()
        local status_ok, mini_files = pcall(require, "mini.files")
        if not status_ok then
            return
        end

        mini_files.setup()
    end,
    keys = {

        {
            "<Leader>bo",
            ":lua MiniFiles.open()<CR>",
            desc = "Open File Browser",
            silent = true,
        },
        {
            "<Leader>bc",
            ":lua MiniFiles.close()<CR>",
            desc = "Close File Browser",
            silent = true,
        },
        {
            "<Leader>br",
            ":lua MiniFiles.refresh()<CR>",
            desc = "Refresh File Browser",
            silent = true,
        },
        {
            "<Leader>bf",
            ":lua MiniFiles.open(vim.api.nvim_buf_get_name(0), false)<CR>",
            desc = "Open File Browser in location of current buffer",
            silent = true,
        },
        {
            "<Leader>bl",
            ":lua MiniFiles.open(MiniFiles.get_latest_path())<CR>",
            desc = "Open File Browser in latest location",
            silent = true,
        },
    },
}
