local set_km = require("modules.utils")

set_km("o", "m", ":<C-U>lua require('tsht').nodes()<CR>", { noremap = false })
set_km("v", "m", ":lua require('tsht').nodes()<CR>")
