local set_km = require("modules.utils")

vim.g.floaterm_height = 0.9
vim.g.floaterm_width = 0.9

set_km("n", "<Leader>pg", ":FloatermNew lazygit<CR>")
set_km("n", "<Leader>pd", ":FloatermNew lazydocker<CR>")
set_km("n", "<Leader>ph", ":FloatermNew htop<CR>")
set_km("n", "<Leader>pn", ":FloatermNew ts-node<CR>")
set_km("n", "<Leader>pe", ":FloatermNew --autoclose=0 ts-node %<CR>")
set_km("n", "<Leader>pt", ":FloatermToggle<CR>")


