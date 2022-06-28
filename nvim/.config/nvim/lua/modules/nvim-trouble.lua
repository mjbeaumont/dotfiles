local set_km = require("modules.utils")

set_km("n", "<Leader>xx", ":TroubleToggle<CR>")
set_km("n", "<Leader>xw", ":TroubleToggle workspace_diagnostics<CR>")
set_km("n", "<Leader>xd", ":TroubleToggle document_diagnostics<CR>")
set_km("n", "<Leader>xq", ":TroubleToggle quickfix<CR>")
set_km("n", "<Leader>xl", ":TroubleToggle loclist<CR>")
set_km("n", "gR", ":TroubleToggle lsp_references<CR>")

