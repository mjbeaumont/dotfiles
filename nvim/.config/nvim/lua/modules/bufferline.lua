local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
    return
end

local set_km = require("modules.utils")

bufferline.setup({
    options = {
        -- NOTE: this plugin is designed with this icon in mind,
        -- and so changing this is NOT recommended, this is intended
        -- as an escape hatch for people who cannot bear it for whatever reason
        numbers = "ordinal",
    },
})

set_km("n", "<Leader>bs", ":BufferLinePick<CR>")
