local status_ok, mini_files = pcall(require, "mini.files")
if not status_ok then
    return
end

local set_km = require("modules.utils")

mini_files.setup();
set_km("n", "<Leader>b", ":lua MiniFiles.open()<CR>")
set_km("n", "<Leader>bc", ":lua MiniFiles.close()<CR>")
set_km("n", "<Leader>br", ":lua MiniFiles.refresh()<CR>")
set_km("n", "<Leader>bf", ":lua MiniFiles.open(vim.api.nvim_buf_get_name(0), false)<CR>")
set_km("n", "<Leader>bl", ":lua MiniFiles.open(MiniFiles.get_latest_path())<CR>")

