vim.g.gitblame_enabled = 0

local set_km = require("modules/utils")

set_km("n", "<Leader>gb", ":GitBlameToggle<CR>")
set_km("n", "<Leader>gbo", ":GitBlameOpenCommitURL<CR>")
